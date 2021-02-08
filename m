Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l97dn-0003ks-Vj
	for mharc-qemu-riscv@gnu.org; Mon, 08 Feb 2021 09:35:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pascal.scholz@tu-dresden.de>)
 id 1l96tF-0004KL-Tl; Mon, 08 Feb 2021 08:47:47 -0500
Received: from mailout6.zih.tu-dresden.de ([141.30.67.75]:56811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pascal.scholz@tu-dresden.de>)
 id 1l96st-0007NF-Bi; Mon, 08 Feb 2021 08:47:41 -0500
Received: from [172.26.34.105] (helo=msx.tu-dresden.de)
 by mailout6.zih.tu-dresden.de with esmtps (TLSv1.2:AES256-SHA256:256)
 (Exim 4.84_2) (envelope-from <pascal.scholz@tu-dresden.de>)
 id 1l96sp-0003sZ-UI; Mon, 08 Feb 2021 14:47:20 +0100
Received: from [192.168.178.68] (91.47.37.16) by
 MSX-L105.msx.ad.zih.tu-dresden.de (172.26.34.105) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 8 Feb 2021 14:47:03 +0100
To: <qemu-devel@nongnu.org>
From: Pascal Scholz <s6899329@msx.tu-dresden.de>
Subject: Emulating sd card with hifive_u risc-v machine
CC: <qemu-riscv@nongnu.org>
Message-ID: <d2511f50-8b72-8a3b-9127-75b3ed98c584@msx.tu-dresden.de>
Date: Mon, 8 Feb 2021 14:47:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: MSX-L101.msx.ad.zih.tu-dresden.de (172.26.34.101) To
 MSX-L105.msx.ad.zih.tu-dresden.de (172.26.34.105)
X-PMWin-Version: 4.0.4, Antivirus-Engine: 3.79.0, Antivirus-Data: 5.81
X-TUD-Virus-Scanned: mailout6.zih.tu-dresden.de
X-TUD-Spam-Mout: yes
Received-SPF: none client-ip=141.30.67.75;
 envelope-from=pascal.scholz@tu-dresden.de; helo=mailout6.zih.tu-dresden.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 08 Feb 2021 09:35:45 -0500
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
X-List-Received-Date: Mon, 08 Feb 2021 13:47:50 -0000

Hi all,

I'm hoping that I addressed the right mailing lists.

I'm working a bit with qemu's risc-v emulation. My current goal is to 
simulate a complete boot process for the SiFive Unleashed Board (SU 540 
SoC)[1]. I've created the correspondig OpenSBI and U-Boot images, being 
the -bios and the -kernel images. It's possible for me to boot up to the 
U-Boot prompt. From this prompt I now want to boot an system image 
located on an emulated sd card.

However I now fail to get a working sd card within qemu for the device 
sifive_u. For example i tried the following command:

qemu-system-riscv64 -M sifive_u -m 8G -serial stdio -bios 
build/platform/sifive/fu540/firmware/fw_jump.bin -kernel 
../../u-boot/u-boot.bin -device sdhci-pci -device sd-card,drive=sdX 
-drive id=sdX,if=none,format=raw,file=path/to/image.elf

This results in Qemu telling me: -device sdhci-pci: No 'PCI' bus found 
for device 'sdhci-pci'.

Using the machine "virt" the command above works.

The thing i tried was:

qemu-system-riscv64 -M sifive_u -m 8G -serial stdio -bios 
opensbi/build/platform/sifive/fu540/firmware/fw_jump.bin -kernel 
../u-boot/u-boot.bin -sd path/to/image.elf

Resulting in: machine type does not support if=sd,bus=0,unit=0


Even if the machine gets stuck at some point when booting, Qemu has no 
problem starting the VM if I use "-M virt" instead of "-M sifive_u". At 
this point i think, that the machine "sifive_u" doesn't support sd 
cards? Is this guess right or is there anything left I can try? After 
all I'm a bit confused, because there seems to be a block device "sd0" 
when I try to start the machine "sifive_u" without any additional 
device/drive arguments. I would really appreciate if someone would tell 
me, what I'm doing wrong.

Thanks in advance and stay healthy!

Best regards

Pascal


[1] https://www.sifive.com/boards/hifive-unleashed


