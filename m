Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E28C61DB9
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 05:12:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzSOk-0004IN-Iz; Thu, 27 Aug 2026 01:11:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSOZ-000462-3N
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 01:11:23 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1wzSOX-0004EI-Gz
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 01:11:22 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-cbb8b54fcf8so1451352a12.0
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 22:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787807480; x=1788412280; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=g7qPAmD5Uc4zNc8vOsv1rG83nWMR8s88x8LyK/YSuMs=;
 b=WWVaQ+3lyeyiCh2Yh4OK2Acdftkixg2hOcG7CO2+9Apb6gDQHKBktr+zRwZ/chSKJF
 5aqrbLHHbDK6E0AvtFHt2sGpMIpR7+XQzc4IA57wxPMoEFe9BFnwbYnyNyG+k+BOYpVU
 vsH4pjqkakV64baW7un0TQsiIAQrs8q4I463fYL0GY5LvGX53yvDORQlvl3VQm7M/ARr
 ImvjhU15p5CGLzrNtUfCTJDF/z5MltLOM4GSVaM6x0gDdPU11A5KNyuBde/CRnTxOF7m
 Wq56VRTjlaviCTepF8WX+wLrXvPBlJzkmk81h4/FjHt8ZyHoy065UOtFpvWpKkvK7iu/
 9jFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787807480; x=1788412280;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=g7qPAmD5Uc4zNc8vOsv1rG83nWMR8s88x8LyK/YSuMs=;
 b=Zr6kxag2g+486MQO5B6YGxKgJqi0tVlC91krggqQv9I5jHPhWcLVMy422OGhINeV8C
 1mpAqvUR7wKLv8U1tfL45qlcfAy+l9ytn9BV5kZn0MRU7K7IUN28CDo4rz7SEXf2ZbJU
 ce7gnYbBkN/Ja5rMCRtfMG7rG2RiGk2Xus1NInoU1AT/AxUTRKIXG6zkQsA6hB+A/lRm
 khZ438w1NKK7qoWecpBIju7JuG6SpjKFK2gfbPeZaOPDhvU58fRBfbivxDuSatS10sRl
 J8XN2ipgMi080UTqY9vQFTWDuID4a7YGEZ9tP5rzhDXa0kwcTVhEU98KZqSLKrGVeYvd
 2ZNA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpp5IzfZ2Ir5qNjRxUMRnTemXpTcq01gL3jCLeKDATYuKE22ej4pjWwpQO2ZNLzBGx5QHEI07d/zsNc@nongnu.org
X-Gm-Message-State: AFuF++kgPpvGVI6IjKg9tkMlPM1YXByCBFr2nSmdaOhGMkuC5SmZ8oSE
 mcExHC0Wbn9VtZDL33FtLBLdEg1q6Szyj6+6JixOe1UDWn72xAc9mv6F
X-Gm-Gg: AR+sD12HZfLwlN3gaSIVpKWIwc3vEvniG38/FkUpbUEYyZfV23pMzLuBqBU29zWbsAq
 pOk3iZiznpCWg5VW3gnQ792tcHbg8boc4pnJbPXBbxvNh/beT5clUIUMr6wdRmj0CuqIB3UcL0e
 lnwWN/EXlWQIAuLO6Ow41Y7tIad4la1vAmEwuKidN6sdPFaAv1DTNSUyxz36gyouTxdlRBA0Lwz
 LO6lbapHXKop3pxkulAtmjgvk2+nNBG2EsWbvKfHb1Fjp5pPDgpuKUIoZ8Wrc0sx7KnQ2bEV+S4
 GwXf9LUcUJyjNX6vElCQCc0Euk2qeoyFC6TT8wH6kOuMC1NyNkYxPhlLO+Xu3fSUzxvkveesk4f
 mA4ZiEoujMMpL1CO4KG34ZA2qFbFZ/t7kF49nNudTqp3dxNLlklY7j8kFLIBrg/25zO+pAGFWaM
 6pnf3hKkSYg/HTyCfDomXw8dlfe8mhHuV9ZHUuuzJdn7Ym8jGNc/jpMY669zDQvkveZK+IgI8TA
 f9UAPrsDqFmjV/PWbVTGhJ2loPiI1NEhN7Imh1D7wRE3hwPJTwUna3rhOXxQjFygyMRyA5hYcuG
 ubCfB6zp+jYk2GGxf4xT
X-Received: by 2002:a17:90b:5828:b0:395:4de4:92be with SMTP id
 98e67ed59e1d1-3966d486840mr26426950a91.13.1787807480024; 
 Wed, 26 Aug 2026 22:11:20 -0700 (PDT)
Received: from donnager-debian.. ([180.150.112.50])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39670599275sm2210473a91.0.2026.08.26.22.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 22:11:19 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: [PATCH 11/12] configure: Provide OBJDUMP to the tcg tests
Date: Thu, 27 Aug 2026 14:39:50 +0930
Message-ID: <20260827050953.67184-12-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827050953.67184-1-joel@jms.id.au>
References: <20260827050953.67184-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=joel.stan@gmail.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Probe for a cross objdump alongside the other binutils and add
OBJDUMP to tests/tcg config-target.mak so test makefiles can
inspect the binaries they build.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 configure | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/configure b/configure
index 56158cd95f7b..b82a43018563 100755
--- a/configure
+++ b/configure
@@ -318,6 +318,7 @@ as="${AS-${cross_prefix}as}"
 ccas="${CCAS-$cc}"
 dlltool="${DLLTOOL-${cross_prefix}dlltool}"
 objcopy="${OBJCOPY-${cross_prefix}objcopy}"
+objdump="${OBJDUMP-${cross_prefix}objdump}"
 ld="${LD-${cross_prefix}ld}"
 ranlib="${RANLIB-${cross_prefix}ranlib}"
 nm="${NM-${cross_prefix}nm}"
@@ -1384,6 +1385,7 @@ probe_target_compiler() {
   container_cross_ld=
   container_cross_nm=
   container_cross_objcopy=
+  container_cross_objdump=
   container_cross_ranlib=
   container_cross_strip=
 
@@ -1489,6 +1491,7 @@ probe_target_compiler() {
     : ${container_cross_ld:=${container_cross_prefix}ld}
     : ${container_cross_nm:=${container_cross_prefix}nm}
     : ${container_cross_objcopy:=${container_cross_prefix}objcopy}
+    : ${container_cross_objdump:=${container_cross_prefix}objdump}
     : ${container_cross_ranlib:=${container_cross_prefix}ranlib}
     : ${container_cross_strip:=${container_cross_prefix}strip}
   done
@@ -1517,6 +1520,7 @@ probe_target_compiler() {
       target_ld=$ld
       target_nm=$nm
       target_objcopy=$objcopy
+      target_objdump=$objdump
       target_ranlib=$ranlib
       target_strip=$strip
       ;;
@@ -1535,6 +1539,7 @@ probe_target_compiler() {
       compute_target_variable $target_arch target_ld ld
       compute_target_variable $target_arch target_nm nm
       compute_target_variable $target_arch target_objcopy objcopy
+      compute_target_variable $target_arch target_objdump objdump
       compute_target_variable $target_arch target_ranlib ranlib
       compute_target_variable $target_arch target_strip strip
       ;;
@@ -1596,6 +1601,7 @@ probe_target_compiler() {
     target_ld=
     target_nm=
     target_objcopy=
+    target_objdump=
     target_ranlib=
     target_strip=
   fi
@@ -1617,6 +1623,7 @@ write_target_makefile() {
     echo "LD=$docker_py cc --cc $container_cross_ld -i qemu/$container_image -s $source_path --"
     echo "NM=$docker_py cc --cc $container_cross_nm -i qemu/$container_image -s $source_path --"
     echo "OBJCOPY=$docker_py cc --cc $container_cross_objcopy -i qemu/$container_image -s $source_path --"
+    echo "OBJDUMP=$docker_py cc --cc $container_cross_objdump -i qemu/$container_image -s $source_path --"
     echo "RANLIB=$docker_py cc --cc $container_cross_ranlib -i qemu/$container_image -s $source_path --"
     echo "STRIP=$docker_py cc --cc $container_cross_strip -i qemu/$container_image -s $source_path --"
   else
@@ -1639,6 +1646,9 @@ write_target_makefile() {
     if test -n "$target_objcopy"; then
       echo "OBJCOPY=$target_objcopy"
     fi
+    if test -n "$target_objdump"; then
+      echo "OBJDUMP=$target_objdump"
+    fi
     if test -n "$target_ranlib"; then
       echo "RANLIB=$target_ranlib"
     fi
@@ -1998,6 +2008,7 @@ preserve_env LD_LIBRARY_PATH
 preserve_env NM
 preserve_env OBJCFLAGS
 preserve_env OBJCOPY
+preserve_env OBJDUMP
 preserve_env PATH
 preserve_env PKG_CONFIG
 preserve_env PKG_CONFIG_LIBDIR
-- 
2.47.3


