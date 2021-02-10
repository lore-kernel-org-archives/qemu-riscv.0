Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l9xJG-0002HW-GX
	for mharc-qemu-riscv@gnu.org; Wed, 10 Feb 2021 16:46:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pascal.scholz@tu-dresden.de>)
 id 1l9vhY-0007fJ-1W; Wed, 10 Feb 2021 15:03:04 -0500
Received: from mailout5.zih.tu-dresden.de ([141.30.67.74]:50849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pascal.scholz@tu-dresden.de>)
 id 1l9vhR-0001zZ-HW; Wed, 10 Feb 2021 15:03:03 -0500
Received: from [172.26.34.105] (helo=msx.tu-dresden.de)
 by mailout5.zih.tu-dresden.de with esmtps (TLSv1.2:AES256-SHA256:256)
 (Exim 4.84_2) (envelope-from <pascal.scholz@tu-dresden.de>)
 id 1l9vhP-0001FX-KC; Wed, 10 Feb 2021 21:02:55 +0100
Received: from [192.168.178.29] (79.249.183.98) by
 MSX-L105.msx.ad.zih.tu-dresden.de (172.26.34.105) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 10 Feb 2021 21:02:48 +0100
Subject: Re: Emulating sd card with hifive_u risc-v machine
To: Alistair Francis <alistair23@gmail.com>, Pascal Scholz
 <s6899329@msx.tu-dresden.de>
CC: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, "open
 list:RISC-V" <qemu-riscv@nongnu.org>
References: <d2511f50-8b72-8a3b-9127-75b3ed98c584@msx.tu-dresden.de>
 <CAKmqyKOVvaVV-WHhm7dwWyO9zSomvTRA5bXJjf=4aRqqjD96rg@mail.gmail.com>
From: Pascal Scholz <pascal.scholz@tu-dresden.de>
Date: Wed, 10 Feb 2021 21:02:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKOVvaVV-WHhm7dwWyO9zSomvTRA5bXJjf=4aRqqjD96rg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: MSX-L104.msx.ad.zih.tu-dresden.de (172.26.34.104) To
 MSX-L105.msx.ad.zih.tu-dresden.de (172.26.34.105)
X-PMWin-Version: 4.0.4, Antispam-Engine: 2.7.2, Antispam-Data:
 2021.2.10.193916, Antivirus-Engine: 3.79.0, Antivirus-Data: 5.81
X-PMWin-Spam: Gauge=XXIIIIIIIII, Probability=29, Report='__SUBJ_REPLY 0,
 __BOUNCE_CHALLENGE_SUBJ 0, __BOUNCE_NDR_SUBJ_EXEMPT 0, __SUBJ_ALPHA_END 0,
 __TO_MALFORMED_2 0, __MULTIPLE_RCPTS_TO_X2 0, __TO_NAME 0,
 __TO_NAME_DIFF_FROM_ACC 0, __HAS_CC_HDR 0, __MULTIPLE_RCPTS_CC_X2 0,
 __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __HAS_REFERENCES 0, __REFERENCES 0,
 __HAS_FROM 0, __HAS_MSGID 0, __SANE_MSGID 0, __USER_AGENT 0,
 __MOZILLA_USER_AGENT 0, __MIME_VERSION 0, __IN_REP_TO 0, __CT 0,
 __CT_TEXT_PLAIN 0, __CTE 0, __URI_HAS_HYPHEN_USC 0, __ANY_URI 0, __URI_MAILTO
 0, __HTTPS_URI 0, __URI_WITH_PATH 0, __URI_ENDS_IN_SLASH 0,
 __FRAUD_BODY_WEBMAIL 0, __CP_MEDIA_BODY 0, __CP_URI_IN_BODY 0, ECARD_WORD 0,
 __SUBJ_ALPHA_NEGATE 0, __MULTIPLE_URI_TEXT 0, __URI_IN_BODY 0, __URI_NOT_IMG
 0, __MAIL_CHAIN 0, __FORWARDED_MSG 0, __BODY_NO_MAILTO 0, __NO_HTML_TAG_RAW
 0, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, __MIME_TEXT_P1 0,
 __MIME_TEXT_ONLY 0, __RDNS_POOLED_10 0, __URI_NS 0, SXL_IP_DYNAMIC 3,
 HTML_00_01 0.05, HTML_00_10 0.05, MULTIPLE_RCPTS 0.1, __TO_REAL_NAMES 0,
 __CC_REAL_NAMES 0, MULTIPLE_REAL_RCPTS 0, IN_REP_TO 0, MSG_THREAD 0,
 BODY_SIZE_5000_LESS 0, RDNS_POOLED 0, RDNS_SUSP_SPECIFIC 0, RDNS_SUSP 0,
 __FRAUD_WEBMAIL 0, REFERENCES 0, LEGITIMATE_SIGNS 0, __MIME_TEXT_P 0,
 __DQ_NEG_IP 0, BODY_SIZE_7000_LESS 0, SENDER_NO_AUTH 0, URI_WITH_PATH_ONLY 0, 
 __DQ_NEG_HEUR 0'
X-PMWin-SpamScore: 29
Message-ID: <91d3712d74d3443397af042388b78865@MSX-L105.msx.ad.zih.tu-dresden.de>
X-TUD-Virus-Scanned: mailout5.zih.tu-dresden.de
X-TUD-Spam-Mout: yes
Received-SPF: none client-ip=141.30.67.74;
 envelope-from=pascal.scholz@tu-dresden.de; helo=mailout5.zih.tu-dresden.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, FORGED_MUA_MOZILLA=2.309,
 NICE_REPLY_A=-0.211, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 10 Feb 2021 16:46:01 -0500
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
X-List-Received-Date: Wed, 10 Feb 2021 20:03:04 -0000

Hi Alistair,

thanks for your quick and helpful reply. :)

I'll see, if I can try them out on the weekend and will report my results.

Best regards and thanks again!

Pascal

On 08.02.21 23:49, Alistair Francis wrote:
> On Mon, Feb 8, 2021 at 12:00 PM Pascal Scholz
> <s6899329@msx.tu-dresden.de> wrote:
>> Hi all,
>>
>> I'm hoping that I addressed the right mailing lists.
> Hello Pascal,
>
> Yep, this is the right place :)
>
>> I'm working a bit with qemu's risc-v emulation. My current goal is to
>> simulate a complete boot process for the SiFive Unleashed Board (SU 540
>> SoC)[1]. I've created the correspondig OpenSBI and U-Boot images, being
>> the -bios and the -kernel images. It's possible for me to boot up to the
>> U-Boot prompt. From this prompt I now want to boot an system image
>> located on an emulated sd card.
>>
>> However I now fail to get a working sd card within qemu for the device
>> sifive_u. For example i tried the following command:
>>
>> qemu-system-riscv64 -M sifive_u -m 8G -serial stdio -bios
>> build/platform/sifive/fu540/firmware/fw_jump.bin -kernel
>> ../../u-boot/u-boot.bin -device sdhci-pci -device sd-card,drive=sdX
>> -drive id=sdX,if=none,format=raw,file=path/to/image.elf
>>
>> This results in Qemu telling me: -device sdhci-pci: No 'PCI' bus found
>> for device 'sdhci-pci'.
>>
>> Using the machine "virt" the command above works.
>>
>> The thing i tried was:
>>
>> qemu-system-riscv64 -M sifive_u -m 8G -serial stdio -bios
>> opensbi/build/platform/sifive/fu540/firmware/fw_jump.bin -kernel
>> ../u-boot/u-boot.bin -sd path/to/image.elf
>>
>> Resulting in: machine type does not support if=sd,bus=0,unit=0
>>
>>
>> Even if the machine gets stuck at some point when booting, Qemu has no
>> problem starting the VM if I use "-M virt" instead of "-M sifive_u". At
>> this point i think, that the machine "sifive_u" doesn't support sd
>> cards? Is this guess right or is there anything left I can try? After
> Correct. There is no SD card support for the SiFive U in QEMU.
>
> You actually just reminded me though that someone has sent patches to
> add support and I need to review them.
>
> You can find the patches here:
> https://patchew.org/QEMU/20210126060007.12904-1-bmeng.cn@gmail.com/
> which should work when applied to QEMU.
>
> If you do get a chance to test the patches it would be great if you
> can let me know what works/doesn't work for you.
>
> Alistair
>
>> all I'm a bit confused, because there seems to be a block device "sd0"
>> when I try to start the machine "sifive_u" without any additional
>> device/drive arguments. I would really appreciate if someone would tell
>> me, what I'm doing wrong.
>>
>> Thanks in advance and stay healthy!
>>
>> Best regards
>>
>> Pascal
>>
>>
>> [1] https://www.sifive.com/boards/hifive-unleashed
>>
>>

