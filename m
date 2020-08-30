Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kCGgK-0006UO-Li
	for mharc-qemu-riscv@gnu.org; Sun, 30 Aug 2020 02:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kCGgJ-0006Sg-1K
 for qemu-riscv@nongnu.org; Sun, 30 Aug 2020 02:19:11 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:29639
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kCGgF-0008SD-NB
 for qemu-riscv@nongnu.org; Sun, 30 Aug 2020 02:19:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598768346;
 h=from:from:sender:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qdueEY1/oWbqO+TNfreaWrPud9o32Z+0RhfvHMpp+90=;
 b=H+dq0xAe0eZfyZq2nBZebEXsaBVQfNhNO/TLVUtwEjagENJo/A5fqdbqFLuamOuDAG+7iq
 XcNls5EPosaqCMaUqcrIih3P+FYKDiPS8dI35jRvbMK1ngc9xi8ODoEep6Zgkz6ptCghQh
 9+eEcg1YV0nSjyXVfGEpsvIp6RCr2ig=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-1WpkUfsbPU-NIPNzhjSamw-1; Sun, 30 Aug 2020 02:18:46 -0400
X-MC-Unique: 1WpkUfsbPU-NIPNzhjSamw-1
Received: by mail-wr1-f72.google.com with SMTP id l15so726758wro.10
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 23:18:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=V2nCr2RPn1NrqT0tvAO1gfWK3iizlxVGfbl5BGyE7jU=;
 b=Sx7nbVf3kLsu1vAimVnJTf4rndkZZ7YfeOCjkEhFHcYUPi3+hpPhpEWWGNJutJgbr7
 4dwede8BFfUGvSqVuRzFK7MTxSU9LcoXdET6T3k0Oe8u56huTKdqYBObDZYvOD61cAxu
 y5s4s9K2qyVvnx5Tk61SRkX7OQY4XJvze1lsJLNrGse2zPVb+7XWBHmD5C6IvUPB76VB
 7c+GqWBiVaZEeu2dNsmYUE88d/B4u5KZEVw4gtQn6xHbaJbGG8fyRVCdcLA1ZLYR8pYV
 B3OFLQ3wecEJ8e+dehCbbB99Iq4uIHUSL3QosWIyVY1jjcCSINqXwN8ZjfKmEYjlJLT2
 1/Lw==
X-Gm-Message-State: AOAM530sVI8cHY8Xh9ttf3Hy1J8c3DDaiZgW2NG5GurDM2a7p59EtXgh
 Bnqw9rDWGRq2Qmz41Xq57McS2ptMMG7GE8x2FNRc/G2H6vY9QTQN176iHF8elsl1fuSEX/GJBb3
 rtvsL/FypEH+5+bQ=
X-Received: by 2002:adf:ebcf:: with SMTP id v15mr6592367wrn.372.1598768325165; 
 Sat, 29 Aug 2020 23:18:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMdNUWHYDZ+ZN1B+yAZiYvgu/Qp49U3uXeyQ4EQlJCL6Y2267ynJAyLbzzzcVVUqLu0CZzUA==
X-Received: by 2002:adf:ebcf:: with SMTP id v15mr6592335wrn.372.1598768324811; 
 Sat, 29 Aug 2020 23:18:44 -0700 (PDT)
Received: from redhat.com (bzq-109-64-136-54.red.bezeqint.net. [109.64.136.54])
 by smtp.gmail.com with ESMTPSA id n8sm6215160wra.32.2020.08.29.23.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Aug 2020 23:18:43 -0700 (PDT)
Sender: Michael Tsirkin <mtsirkin@redhat.com>
From: mst@redhat.com
X-Google-Original-From: "Michael S. Tsirkin" <mst@redhat.com>,
 Nathan Chancellor <natechancellor@gmail.com>
Date: Sun, 30 Aug 2020 02:18:39 -0400
To: Bug 1892540 <1892540@bugs.launchpad.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-stable@nongnu.org, Richard Henderson <rth@twiddle.net>,
 qemu-riscv@nongnu.org
Subject: Re: [Bug 1892540] [RFC PATCH v2] hw/display/tcx: Allow 64-bit
 accesses to framebuffer stippler and blitter
Message-ID: <20200830021257-mutt-send-email-mst@kernel.org>
References: <159803735569.2614.10182276398047269277.malonedeb@chaenomeles.canonical.com>
 <20200822142127.1316231-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20200822142127.1316231-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/30 02:19:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sun, 30 Aug 2020 06:19:11 -0000

On Sat, Aug 22, 2020 at 02:21:27PM -0000, Philippe Mathieu-Daudé wrote:
> The S24/TCX datasheet is listed as "Unable to locate" on [1].
> 
> However the NetBSD revision 1.32 of the driver introduced
> 64-bit accesses to the stippler and blitter [2]. It is safe
> to assume these memory regions are 64-bit accessible.
> QEMU implementation is 32-bit, so fill the 'impl' fields.
> 
> [1] http://web.archive.org/web/20111209011516/http://wikis.sun.com/display/FOSSdocs/Home
> [2] http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/dev/sbus/tcx.c.diff?r1=1.31&r2=1.32
> 
> Reported-by: Andreas Gustafsson <gson@gson.org>
> Buglink: https://bugs.launchpad.net/bugs/1892540
> Fixes: 55d7bfe2293 ("tcx: Implement hardware acceleration")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Philippe, did you submit the patch on the mailing list
normally too? I don't seem to see it there.

the patch seems to work for me:

Tested-by: Michael S. Tsirkin <mst@redhat.com>


CC Nathan who reported a similar failure.

Nathan, does the patch below fix the issue for you?

> ---
> Since v1:
> - added missing uncommitted staged changes... (tcx_blit_ops)
> ---
 hw/display/tcx.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/hw/display/tcx.c b/hw/display/tcx.c
index 1fb45b1aab8..96c6898b149 100644
--- a/hw/display/tcx.c
+++ b/hw/display/tcx.c
@@ -548,20 +548,28 @@ static const MemoryRegionOps tcx_stip_ops = {
     .read = tcx_stip_readl,
     .write = tcx_stip_writel,
     .endianness = DEVICE_NATIVE_ENDIAN,
-    .valid = {
+    .impl = {
         .min_access_size = 4,
         .max_access_size = 4,
     },
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 8,
+    },
 };
 
 static const MemoryRegionOps tcx_rstip_ops = {
     .read = tcx_stip_readl,
     .write = tcx_rstip_writel,
     .endianness = DEVICE_NATIVE_ENDIAN,
-    .valid = {
+    .impl = {
         .min_access_size = 4,
         .max_access_size = 4,
     },
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 8,
+    },
 };
 
 static uint64_t tcx_blit_readl(void *opaque, hwaddr addr,
@@ -650,10 +658,14 @@ static const MemoryRegionOps tcx_rblit_ops = {
     .read = tcx_blit_readl,
     .write = tcx_rblit_writel,
     .endianness = DEVICE_NATIVE_ENDIAN,
-    .valid = {
+    .impl = {
         .min_access_size = 4,
         .max_access_size = 4,
     },
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 8,
+    },
 };
 
 static void tcx_invalidate_cursor_position(TCXState *s)


-----------------------------------------------------------

I think you shouldn't specify .min_access_size in impl, since
that also allows 1 and 2 byte accesses from guest.



> -- 
> 2.26.2
> 
> -- 
> You received this bug notification because you are subscribed to the bug
> report.
> https://bugs.launchpad.net/bugs/1892540
> 
> Title:
>   qemu can no longer boot NetBSD/sparc
> 
> Status in QEMU:
>   New
> 
> Bug description:
>   Booting NetBSD/sparc in qemu no longer works.  It broke between qemu
>   version 5.0.0 and 5.1.0, and a bisection identified the following as
>   the offending commit:
> 
>     [5d971f9e672507210e77d020d89e0e89165c8fc9] memory: Revert "memory:
>   accept mismatching sizes in memory_region_access_valid"
> 
>   It's still broken as of 7fd51e68c34fcefdb4d6fd646ed3346f780f89f4.
> 
>   To reproduce, run
> 
>     wget http://ftp.netbsd.org/pub/NetBSD/NetBSD-9.0/images/NetBSD-9.0-sparc.iso
>     qemu-system-sparc -nographic -cdrom NetBSD-9.0-sparc.iso -boot d
> 
>   The expected behavior is that the guest boots to the prompt
> 
>     Installation medium to load the additional utilities from:
> 
>   The observed behavior is a panic:
> 
>     [   1.0000050] system[0]: trap 0x29: pc=0xf0046b14 sfsr=0xb6 sfva=0x54000000
>     [   1.0000050] cpu0: data fault: pc=0xf0046b14 addr=0x54000000 sfsr=0xb6<PERR=0x0,LVL=0x0,AT=0x5,FT=0x5,FAV,OW>
>     [   1.0000050] panic: kernel fault
>     [   1.0000050] halted
> 
> To manage notifications about this bug go to:
> https://bugs.launchpad.net/qemu/+bug/1892540/+subscriptions


