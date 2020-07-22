Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jyAk6-0000l2-Kn
	for mharc-qemu-riscv@gnu.org; Wed, 22 Jul 2020 05:08:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alr48@hermes.cam.ac.uk>)
 id 1jyAk4-0000i9-4w; Wed, 22 Jul 2020 05:08:48 -0400
Received: from ppsw-33.csi.cam.ac.uk ([131.111.8.133]:56002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alr48@hermes.cam.ac.uk>)
 id 1jyAk0-0003u5-0s; Wed, 22 Jul 2020 05:08:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cam.ac.uk; 
 s=20180806.ppsw;
 h=Sender:Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FU9uRHGIFzKOZZcOXkKiOIJjLfH3CcnX0L841Wsc4J4=; b=ZtZRi3cWXu9IJPKLsIS0I4OUrW
 zs3ekghVlvXVkHyu+PntYLURRFX0jG3DJOuvg6k+aKq4+DbC96T1ltLW0/4XfB1vb/Eka83nvlICu
 5kAYXt8ldLVobQsjmZTY/9PEaYrhfB/f9W5SvmSmbjYvrKLcT4IRFT4d1Eexe+AyU2OY=;
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from mail-il1-f180.google.com ([209.85.166.180]:46815)
 by ppsw-33.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:587)
 with esmtpsa (PLAIN:alr48) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jyAjs-00030y-gK (Exim 4.92.3)
 (return-path <alr48@hermes.cam.ac.uk>); Wed, 22 Jul 2020 10:08:36 +0100
Received: by mail-il1-f180.google.com with SMTP id p15so627056ilh.13;
 Wed, 22 Jul 2020 02:08:36 -0700 (PDT)
X-Gm-Message-State: AOAM533P5nM6/pdGNVi3f7s2qaVlbCXiOwAwG3h+pc1qbDaRC068umUZ
 3tXE/9g+dja04Rv9ZHRTGCMDnm/INXwFpI2J6sI=
X-Google-Smtp-Source: ABdhPJxlyMpgGxxb4U/9bsejMy67vODawKA4ZjBuTRm42eURmZGNbc05p2d6b3V/v4z2eqpLdsn+G2hPUWbXCL48iQg=
X-Received: by 2002:a92:1592:: with SMTP id 18mr31659859ilv.17.1595408915076; 
 Wed, 22 Jul 2020 02:08:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1595335112.git.zong.li@sifive.com>
 <26ac4734d2079d5ec782adef3a5a40e82082b51f.1595335112.git.zong.li@sifive.com>
In-Reply-To: <26ac4734d2079d5ec782adef3a5a40e82082b51f.1595335112.git.zong.li@sifive.com>
From: Alexander Richardson <Alexander.Richardson@cl.cam.ac.uk>
Date: Wed, 22 Jul 2020 10:08:19 +0100
X-Gmail-Original-Message-ID: <CAEeofchMe3H35zmuyzbVMOWOKrYZwfEGT9UVRb4k8L18WwW8PQ@mail.gmail.com>
Message-ID: <CAEeofchMe3H35zmuyzbVMOWOKrYZwfEGT9UVRb4k8L18WwW8PQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] target/riscv: Fix the translation of physical
 address
To: Zong Li <zong.li@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bmeng.cn@gmail.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: "A.L. Richardson" <alr48@hermes.cam.ac.uk>
Received-SPF: pass client-ip=131.111.8.133;
 envelope-from=alr48@hermes.cam.ac.uk; helo=ppsw-33.csi.cam.ac.uk
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/22 05:08:36
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 22 Jul 2020 09:08:48 -0000

On Tue, 21 Jul 2020 at 13:43, Zong Li <zong.li@sifive.com> wrote:
>
> The real physical address should add the 12 bits page offset. It also
> causes the PMP wrong checking due to the minimum granularity of PMP is
> 4 byte, but we always get the physical address which is 4KB alignment,
> that means, we always use the start address of the page to check PMP for
> all addresses which in the same page.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  target/riscv/cpu_helper.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 75d2ae3434..08b069f0c9 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -543,7 +543,8 @@ restart:
>              /* for superpage mappings, make a fake leaf PTE for the TLB's
>                 benefit. */
>              target_ulong vpn = addr >> PGSHIFT;
> -            *physical = (ppn | (vpn & ((1L << ptshift) - 1))) << PGSHIFT;
> +            *physical = ((ppn | (vpn & ((1L << ptshift) - 1))) << PGSHIFT) |
> +                        (addr & ~TARGET_PAGE_MASK);
>
>              /* set permissions on the TLB entry */
>              if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
> --
> 2.27.0

I made the same change for our CHERI fork a few months ago but forgot
to send the patch upstream (despite marking the commit as a candidate
for upstreaming). Sorry about the duplicated debugging work!
(https://github.com/CTSRD-CHERI/qemu/commit/61c8e3f2c0fd4965ec3f316146d1751fae673c12)

