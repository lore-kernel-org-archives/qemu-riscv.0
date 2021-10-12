Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ma6ri-0004pi-Cw
	for mharc-qemu-riscv@gnu.org; Mon, 11 Oct 2021 21:46:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <limingwang@huawei.com>)
 id 1ma6rg-0004pT-Hi; Mon, 11 Oct 2021 21:46:00 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <limingwang@huawei.com>)
 id 1ma6rd-0006wn-2v; Mon, 11 Oct 2021 21:46:00 -0400
Received: from dggeme703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HSyzm47RDz8yfT;
 Tue, 12 Oct 2021 09:40:52 +0800 (CST)
Received: from huawei.com (10.174.187.17) by dggeme703-chm.china.huawei.com
 (10.1.199.99) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.8; Tue, 12
 Oct 2021 09:45:41 +0800
From: MingWang Li <limingwang@huawei.com>
To: <palmer@dabbelt.com>, <alistair.francis@wdc.com>, <bin.meng@windriver.com>
CC: <qemu-riscv@nongnu.org>, <qemu-devel@nongnu.org>,
 <wanghaibin.wang@huawei.com>, <jiangyifei@huawei.com>, <fanliang@huawei.com>, 
 <wu.wubin@huawei.com>, Mingwang Li <limingwang@huawei.com>
Subject: [PATCH v2] hw/riscv: virt: bugfix the memory-backend-file command is
 invalid
Date: Tue, 12 Oct 2021 09:45:01 +0800
Message-ID: <20211012014501.24996-1-limingwang@huawei.com>
X-Mailer: git-send-email 2.19.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.187.17]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggeme703-chm.china.huawei.com (10.1.199.99)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=limingwang@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Oct 2021 01:46:01 -0000

From: Mingwang Li <limingwang@huawei.com>

When I start the VM with the following command:
$ ./qemu-system-riscv64 -M virt,accel=kvm -m 4096M -cpu host -nographic \
    -name guest=riscv-guset \
    -smp 2 \
    -bios none \
    -kernel ./Image \
    -drive file=./guest.img,format=raw,id=hd0 \
    -device virtio-blk-device,drive=hd0 \
    -append "root=/dev/vda rw console=ttyS0 earlycon=sbi" \
    -object memory-backend-file,id=mem,size=4096M,mem-path=/dev/hugepages,share=on \
    -numa node,memdev=mem -mem-prealloc \
    -chardev socket,id=char0,path=/mnt/vhost-net0 \
    -netdev type=vhost-user,id=mynet1,chardev=char0,vhostforce \
    -device virtio-net-pci,mac=52:54:00:00:00:01,netdev=mynet1,mrg_rxbuf=on,csum=on,guest_csum=on,guest_ecn=on \

Then, QEMU displays the following error information:
qemu-system-riscv64: Failed initializing vhost-user memory map, consider using -object memory-backend-file share=on
qemu-system-riscv64: vhost_set_mem_table failed: Interrupted system call (4)
qemu-system-riscv64: unable to start vhost net: 4: falling back on userspace virtio

Note that, before starting the kvm-acceled QEMU VM, following
temporarily unaccepted QEMU patches should be used:
https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg02516.html

This error was made bacause default main_mem is used to be registered
as the system memory, other memory cannot be initialized. Therefore,
the system memory should be initialized to the machine->ram, which
consists of the default main_mem and other possible memory required
by applications, such as shared hugepage memory in DPDK.
Also, the mc->defaul_ram_id should be set to the default main_mem,
such as "riscv_virt_board.ram" for the virt machine.

Signed-off-by: Mingwang Li <limingwang@huawei.com>
Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index ec0cb69b8c..b3b431c847 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -771,7 +771,6 @@ static void virt_machine_init(MachineState *machine)
     const MemMapEntry *memmap = virt_memmap;
     RISCVVirtState *s = RISCV_VIRT_MACHINE(machine);
     MemoryRegion *system_memory = get_system_memory();
-    MemoryRegion *main_mem = g_new(MemoryRegion, 1);
     MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
     char *plic_hart_config, *soc_name;
     target_ulong start_addr = memmap[VIRT_DRAM].base;
@@ -890,10 +889,8 @@ static void virt_machine_init(MachineState *machine)
     }
 
     /* register system main memory (actual RAM) */
-    memory_region_init_ram(main_mem, NULL, "riscv_virt_board.ram",
-                           machine->ram_size, &error_fatal);
     memory_region_add_subregion(system_memory, memmap[VIRT_DRAM].base,
-        main_mem);
+        machine->ram);
 
     /* create device tree */
     create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
@@ -1032,6 +1029,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
     mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
     mc->numa_mem_supported = true;
+    mc->default_ram_id = "riscv_virt_board.ram";
 
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
 
-- 
2.19.1


