Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224D4606A326
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 18:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XFFo42SI
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xP2He-0005Co-P1; Thu, 05 Nov 2026 13:34:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xP2H9-00056Q-5g
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 13:33:28 -0500
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xP2H5-0007cI-8q
 for qemu-riscv@nongnu.org; Thu, 05 Nov 2026 13:33:26 -0500
Received: by mail-dy1-x1329.google.com with SMTP id
 5a478bee46e88-36e99cf7bb3so1170419eec.0
 for <qemu-riscv@nongnu.org>; Thu, 05 Nov 2026 10:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793903600; x=1794508400; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:content-type:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=pkzSMe5TXc03KOVNMjdAF67pSs69m4jsQa6dvekI638=;
 b=XFFo42SIR6ISJSy0RP8j9drRki+oQyzGrJxB9htUci98zU1lS+BB+n7RyZjXTIkSwy
 DWgXhfYEsExpWFvyPYVqrCPUY835J5aPEg37xyNORIMgzNdx9Lclo3Vv+b0DZMUynWgg
 eKGjcagXh2O7WiDAuKJb28kJXa4UklIEZxZRhit9yOXUYSmw8F6JW3dQU/v2zCejC+41
 RGo2nR6aXRTFSetLmLB3Dx0sk+HWSpKPob4N5H597TGA9/lwbBKy0ivBA/EmX9duPkS4
 HN8U7b9erNwqI2WGhLHvguuIGcEoSHvtBHAygtyAaXoacuuAsXW6x9/6ViFSwJDVZRHp
 nM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793903600; x=1794508400;
 h=content-transfer-encoding:mime-version:content-type:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=pkzSMe5TXc03KOVNMjdAF67pSs69m4jsQa6dvekI638=;
 b=ymNkgRaSG8cDppc2cKQUu0Z0vEAdgFF5U4NpcVqY13u4iFpEM4GcF451IytN5f5Wx6
 jbivJe3tbcIEDAM0dmJIQo/JeUoEcteKWTuz+gpt/YoWRuKgcz/UjjBl3dRfwBOLcUqe
 O2QkUdeBttYnnZMFg0Gdx78BVWim4rpHm3O2stLIU2bmyHstyZsFYj0nkPc5SbYMu4KI
 ZbI0Wu9m7PlDE2Q0oXJ1F8pZ3JSFWKCvG83eSEo4ml42TqWM6dL7ZBTiekMxCg9KijtX
 NhucafhsVHOIRKfXRsfMb8pJyBov7zBfWe4ZpW7qA0ztjvhSPcW97x/5epH3FHrN6S1k
 A9kg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwXmQUESr3ZKW7lXUX/lAD+NUsmUmALBPs8oFGVN2FN2OpzKP9iBMFX7KnXgqnoVEJfsOZA/dmjRBw2@nongnu.org
X-Gm-Message-State: APuU4Z8/IObzdT/Au41kQZHa3RqBOiLuS7usVbn0goCzkdlVqJvufljv
 /uQGDFEiG53TIivm97VcUC7j68FukCkhNvV2P0h03bzK4du4V2bfq3iF
X-Gm-Gg: AYBFou2V6Qs5NlDOBdzzI81w3YQQM6sUvOqkoaP4qQ2+ipf7LEe13K8yabUyI0isLSD
 Wpse7MF1u5+pKLEmAtnk1PTZK/mpOCzM2FzR1AmHGX3ZN/Ss4ZyFHpi5YTUUMzJ/TV45Ls1pYG/
 zzbg/Jh/2WfKX3XLol14EphVEVf93ufPx/TtrREvJLiAsWLggUQEYuz2nSaj/D+VQGuYORQzmgv
 VnPgMtrOL4oWSqyx4CrbQuTkokkFFFoiYXs3HekkrVoQxOpyUjgFzrMOycG5QRQ3zdrvpOaEsJU
 ies4RerLAZk6pv35DqPsssOEqguV5RmP7dY19URuTME8AUD/5Wl1EN6EIfYFxdCPyeU8EAHWWWH
 6r1xVX3OI9cu1D1YDktlvZEGFJku7X/9Y8FfWT9Ube2UdKVcnpTJ9G20C0GqCtxIKEL/bpiUBP/
 6aGxXEdR8FA4dQt/Uik1JvzsPnDUtqWu7PdHkmnqe9SegIfMiJORqZXBZw76QIcPwK5iBznktZ8
 Xe2THCnDJg64gawiAKCja+/ebIHtY9kFKLgKMwOX9uWmYaLBns3YIq4XnptoTskWcz2oirSvO01
 a4ykP29B7pjpnu/Wwz68BPeNcDg/iy5bkOgeJea+v6g+a0C2ltj/BgNTk2DIY1mBn2JWZg==
X-Received: by 2002:a05:693c:62ce:b0:360:d4c5:7243 with SMTP id
 5a478bee46e88-36a42362451mr27729773eec.11.1793903599992; 
 Thu, 05 Nov 2026 10:33:19 -0800 (PST)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-36f66086a4asm277795eec.0.2026.11.05.10.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 10:33:19 -0800 (PST)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Chao Liu <chao.liu@processmission.com>,
 Peter Maydell <peter.maydell@linaro.org>, Weiwei Li <liwei1518@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Glenn Miles <milesg@linux.ibm.com>, Zhao Liu <zhao1.liu@intel.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-ppc@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v4 0/3] Register accel-$cpu_type for all targets
Date: Fri,  6 Nov 2026 02:33:06 +0800
Message-ID: <20261105183310.1614-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1329;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy1-x1329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A multi-target system binary links more than one target.
accel_cpu_register_type() creates the abstract parent accel-$cpu_type for each
target that has an AccelCPU subclass. ARM, i386, RISC-V, and PowerPC call it.
Other targets have no such subclass, and machine init skips a missing class.

test-multi-target checks the parent only for the CPU types that register it.

This is an alternative to gating accelerator CPU types with is_available. The
RISC-V TCG and KVM gates are reverted here as redundant.

v3: https://lore.kernel.org/qemu-devel/20261031170925.789-1-luoyonggang@gmail.com/

Changes v3 -> v4:

- Drop accel-cpu-target.c and the once-per-TARGET_BASE_ARCH build. Register the
  parent with accel_cpu_register_type() only where an AccelCPU subclass exists
- Call it from ARM, i386, RISC-V, and PowerPC. v3 registered a parent for every
  linked target
- Check those parents from test_qom_types_are_unique(). v3 expected one for
  every target in the test

Yonggang Luo (3):
  accel: register CPU parent only for AccelCPU subclasses
  Revert "target/riscv/kvm: restrict kvm-accel-riscv-cpu to riscv
    targets"
  Revert "target/riscv/tcg: restrict tcg-accel-riscv-cpu to riscv
    targets"

 accel/accel-common.c           |  6 ++----
 include/accel/accel-cpu.h      |  2 ++
 target/arm/cpu.c               |  2 ++
 target/i386/cpu.c              |  2 ++
 target/ppc/cpu_init.c          |  2 ++
 target/riscv/cpu.c             |  8 ++++++++
 target/riscv/kvm/kvm-cpu.c     |  2 --
 target/riscv/tcg/tcg-cpu.c     |  1 -
 tests/unit/test-multi-target.c | 25 +++++++++++++++++++++++++
 9 files changed, 43 insertions(+), 7 deletions(-)

-- 
2.55.0.windows.3


