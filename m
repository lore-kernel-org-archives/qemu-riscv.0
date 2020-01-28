Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iwUPw-0002zP-PP
	for mharc-qemu-riscv@gnu.org; Tue, 28 Jan 2020 12:12:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42908)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <josemartins90@gmail.com>) id 1iwUPu-0002zJ-Db
 for qemu-riscv@nongnu.org; Tue, 28 Jan 2020 12:12:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <josemartins90@gmail.com>) id 1iwUPt-0001bm-Ad
 for qemu-riscv@nongnu.org; Tue, 28 Jan 2020 12:12:46 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:51632)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <josemartins90@gmail.com>)
 id 1iwUPt-0001aw-4O
 for qemu-riscv@nongnu.org; Tue, 28 Jan 2020 12:12:45 -0500
Received: by mail-wm1-x342.google.com with SMTP id t23so3383470wmi.1
 for <qemu-riscv@nongnu.org>; Tue, 28 Jan 2020 09:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :content-transfer-encoding:user-agent;
 bh=kN9ifczQL8keW4QDrKt6zbT06z7gDhVP2w5CMl0zq9Q=;
 b=s8a0qxmMKPqAg6Gi3JYbTqUlQmv/jEGAwmFrVnX9RcXEtXnUzS4XiDUrmb5NvdumQ9
 Qsp7fymwNMbapXcqiiGkgSU60wUxDUaHR98vH09DJpmg1mu+8Oq7httjRqZizLMXfgRh
 OpwJ0+NeguqmCbtiP0UGgZeKBD1GAnJ1jkpfySQpwq9sbEBR1sxS6NGJclooaxAnsngh
 o8mLlZSe7/CHBXxyqJDPVeTTHGXX2rOB5gk0kIaWZGBJpume9l3mjcifi5yBLIXWcDiS
 yxeHgtRTtqsuFDpprs56l0n8f212eNJVvH1UN1rJYuMu68XQgBLU5R0O298/QX/scG6c
 eBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding:user-agent;
 bh=kN9ifczQL8keW4QDrKt6zbT06z7gDhVP2w5CMl0zq9Q=;
 b=M5fzPAMvwK+aM/IpVWl8u9lUQRggDE6aIN2F8IjqHpAniWLbVjFk5ksGFhe/O7hcCv
 +fnrSW+bnwfxBF9QjApzy7/goO5sBnaUBwtV812Z78ECEIxZpILR1HocVsrUgNO3ixLV
 nkzV6ZXdJ++NWSDwAzEdmoDS8EXrOrjtMXYHjMZGqc6vmS3HX4NLWtzCEZoFF5QWSGnU
 cLrie4aW7JeDzY1l4NjgX82U6AfDqLkq+0VT6Mlj74y2w9GTntWzwQphz1ZYc2IV5Smp
 eVmQBTBOSl/O3p5mCFDYYJkloyGO6LS1NcsgqXHMZiLq/+/JX/99Krbq2R8GbcfAY6Mm
 LnMg==
X-Gm-Message-State: APjAAAWL1+o3L5hilviXB7UsLX0sF5G2yy1gUFk4de12UvypO24iZGT7
 RAxq2w1uYBIV3tBPDgsiL+ZGAnauDko=
X-Google-Smtp-Source: APXvYqzhjBCm5AtXDQQ84i+DiFbiEqecEg1/tfdFD2Ua0hilkAkrAMymN2AZNUL6cQzK3D/mw3YNOw==
X-Received: by 2002:a1c:1d02:: with SMTP id d2mr6422335wmd.185.1580231563101; 
 Tue, 28 Jan 2020 09:12:43 -0800 (PST)
Received: from n552vx ([193.137.92.130])
 by smtp.gmail.com with ESMTPSA id i204sm4022695wma.44.2020.01.28.09.12.41
 for <qemu-riscv@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 28 Jan 2020 09:12:42 -0800 (PST)
Date: Tue, 28 Jan 2020 17:12:35 +0000
From: Jose Martins <josemartins90@gmail.com>
To: qemu-riscv@nongnu.org
Subject: [PATCH] riscv/target: fix vs interrupt delegation
Message-ID: <20200128171233.qpuyzpiopgvqxuuz@n552vx>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: NeoMutt/20171215
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
X-List-Received-Date: Tue, 28 Jan 2020 17:12:47 -0000

Hello,

I've been having an issue delegating external interrupts to VS mode. I've set
the VSEI bit in hideleg. Then, to trigger the interrupt I set the VSEIP bit in
hip. However, this does not forward the external interrupt to VS mode, but to
HS mode.

Looking through the code, I see the VS to S interrupt cause translation is done
in riscv_cpu_local_irq_pending by immediately shifting right the pending vs
interrupts. So, this function will return the same cause either this is a HS
interrupt or a VS interrupt. Later, in riscv_cpu_do_interrupt, this is not
taken into account when checking the pending interrupt against the hypervisor
interrupt delegation register (hideleg). There will never be a match as the "normal"
supervisor interrupt cannot be delegated to VS mode.

I believe an easy fix is to delay the cause translation until we know this
is indeed a delegated VS mode interrupt. Here is a patch:

Signed-off-by: José Martins <josemartins90@gmail.com>
---
 target/riscv/cpu_helper.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 7166e6199e..161dc34e0d 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -46,7 +46,7 @@ static int riscv_cpu_local_irq_pending(CPURISCVState *env)
     target_ulong pending = env->mip & env->mie &
                                ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
     target_ulong vspending = (env->mip & env->mie &
-                              (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)) >> 1;
+                              (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP));

     target_ulong mie    = env->priv < PRV_M ||
                           (env->priv == PRV_M && mstatus_mie);
@@ -892,6 +892,9 @@ void riscv_cpu_do_interrupt(CPUState *cs)
             if (riscv_cpu_virt_enabled(env) && ((hdeleg >> cause) & 1) &&
                 !riscv_cpu_force_hs_excep_enabled(env)) {
                 /* Trap to VS mode */
+                if(async){
+                    cause -= 1;
+                }
             } else if (riscv_cpu_virt_enabled(env)) {
                 /* Trap into HS mode, from virt */
                 riscv_cpu_swap_hypervisor_regs(env);
--
2.17.1

Regards,
Jose


