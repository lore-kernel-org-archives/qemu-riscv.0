Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nwElv-0006HG-77
	for mharc-qemu-riscv@gnu.org; Tue, 31 May 2022 23:11:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <limingwang@huawei.com>)
 id 1nwElt-0006H2-Bb; Tue, 31 May 2022 23:11:45 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <limingwang@huawei.com>)
 id 1nwElq-0003Cp-E7; Tue, 31 May 2022 23:11:45 -0400
Received: from kwepemi100003.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LCYzt0HKhzjXGM;
 Wed,  1 Jun 2022 11:10:18 +0800 (CST)
Received: from kwepemm600019.china.huawei.com (7.193.23.64) by
 kwepemi100003.china.huawei.com (7.221.188.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 1 Jun 2022 11:11:27 +0800
Received: from canpemm500004.china.huawei.com (7.192.104.92) by
 kwepemm600019.china.huawei.com (7.193.23.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 1 Jun 2022 11:11:27 +0800
Received: from canpemm500004.china.huawei.com ([7.192.104.92]) by
 canpemm500004.china.huawei.com ([7.192.104.92]) with mapi id 15.01.2375.024;
 Wed, 1 Jun 2022 11:11:27 +0800
From: "limingwang (A)" <limingwang@huawei.com>
To: Alistair Francis <alistair.francis@opensource.wdc.com>, Jiangyifei
 <jiangyifei@huawei.com>, "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "thuth@redhat.com" <thuth@redhat.com>, Bin Meng <bin.meng@windriver.com>, 
 "alistair23@gmail.com" <alistair23@gmail.com>, Alistair Francis
 <Alistair.Francis@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>
Subject: RE: [PATCH] hw/intc: sifive_plic: Avoid overflowing the addr_config
 buffer
Thread-Topic: [PATCH] hw/intc: sifive_plic: Avoid overflowing the addr_config
 buffer
Thread-Index: AQHYdVgYXQy2dn8/VEa7gm3baoUOJK0534iw
Date: Wed, 1 Jun 2022 03:11:27 +0000
Message-ID: <3c8293cc07e147dd9923ee5174cb55fa@huawei.com>
References: <20220601013631.196854-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220601013631.196854-1-alistair.francis@opensource.wdc.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.187.17]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=limingwang@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Jun 2022 03:11:45 -0000

>=20
> From: Alistair Francis <alistair.francis@wdc.com>
>=20
> Since commit ad40be27 "target/riscv: Support start kernel directly by KVM=
" we
> have been overflowing the addr_config on "M,MS..."
> configurations, as reported https://gitlab.com/qemu-project/qemu/-/issues=
/1050.
>=20
> This commit changes the loop in sifive_plic_create() from iterating over =
the number
> of harts to just iterating over the addr_config. The addr_config is based=
 on the
> hart_config, and will contain interrup details for all harts. This way we=
 can't iterate
> past the end of addr_config.
>=20
> Fixes: ad40be27084536 ("target/riscv: Support start kernel directly by KV=
M")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1050
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Reviewed-by: Mingwang Li <limingwang@huawei.com>

Mingwang
> ---
>  hw/intc/sifive_plic.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
>=20
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c index
> eebbcf33d4..56d60e9ac9 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -431,7 +431,7 @@ DeviceState *sifive_plic_create(hwaddr addr, char
> *hart_config,
>      uint32_t context_stride, uint32_t aperture_size)  {
>      DeviceState *dev =3D qdev_new(TYPE_SIFIVE_PLIC);
> -    int i, j =3D 0;
> +    int i;
>      SiFivePLICState *plic;
>=20
>      assert(enable_stride =3D=3D (enable_stride & -enable_stride)); @@ -4=
51,18
> +451,17 @@ DeviceState *sifive_plic_create(hwaddr addr, char *hart_config=
,
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
>=20
>      plic =3D SIFIVE_PLIC(dev);
> -    for (i =3D 0; i < num_harts; i++) {
> -        CPUState *cpu =3D qemu_get_cpu(hartid_base + i);
>=20
> -        if (plic->addr_config[j].mode =3D=3D PLICMode_M) {
> -            j++;
> -            qdev_connect_gpio_out(dev, num_harts + i,
> +    for (i =3D 0; i < plic->num_addrs; i++) {
> +        int cpu_num =3D plic->addr_config[i].hartid;
> +        CPUState *cpu =3D qemu_get_cpu(hartid_base + cpu_num);
> +
> +        if (plic->addr_config[i].mode =3D=3D PLICMode_M) {
> +            qdev_connect_gpio_out(dev, num_harts + cpu_num,
>                                    qdev_get_gpio_in(DEVICE(cpu),
> IRQ_M_EXT));
>          }
> -
> -        if (plic->addr_config[j].mode =3D=3D PLICMode_S) {
> -            j++;
> -            qdev_connect_gpio_out(dev, i,
> +        if (plic->addr_config[i].mode =3D=3D PLICMode_S) {
> +            qdev_connect_gpio_out(dev, cpu_num,
>                                    qdev_get_gpio_in(DEVICE(cpu),
> IRQ_S_EXT));
>          }
>      }
> --
> 2.35.3


