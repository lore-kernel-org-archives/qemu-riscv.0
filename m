Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B41C02180
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 18:44:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tY8Mh-00086n-Tj; Wed, 15 Jan 2025 13:43:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tY8Mg-00086I-Vg
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2025 13:43:43 -0500
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tY8Mf-00038x-4b
 for qemu-riscv@nongnu.org; Wed, 15 Jan 2025 13:43:42 -0500
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-7231e2ac9e4so25012a34.0
 for <qemu-riscv@nongnu.org>; Wed, 15 Jan 2025 10:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1736966620; x=1737571420; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AwZYeq4K+W1NQDBMX/lyZ5hy5MmdrAMvZUdnjdWaIb8=;
 b=hLXCjySec1Hu7oSmSvQ9bIfHCVMkV3tt188KAcNpmHo8BdxLrTrll0vQLeTLdLr3vr
 ZlGw9cXT5J3aVCydBTn8JFAgD4j/larMRwNugMn0Xai/Am6cnBLrpur37E3TYth0tEoQ
 WLyyT9FyguRAUjMuizFXx+Ra/7Y98RXzQL2Q6+p9Qse/NZGfjdJLGyPKHppnTfphm1Nl
 tp9zIoQ9Ge2I+nzpX28qLy/7erGilANtNx0ER+aGnYuwtIpOjdBGH+fdi6vq9AChBDuQ
 OwnVRSNmthBggq3xfUU5Aqr83T6GP4hy1KFlfQytm1FiYFb0boZwUNVQWbS+fdV7dpvX
 5cBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736966620; x=1737571420;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AwZYeq4K+W1NQDBMX/lyZ5hy5MmdrAMvZUdnjdWaIb8=;
 b=O5KWuwMdymt0wosJ1DrLyutDuHsKntlJh7DzMzPaQwVBWlJIoe+Dv/OEdVz6CthaDX
 P0BU1A1SnTi9aYSOIPiE0ku8aJFjuASpd9Ew31fZwvnRMjcpLFKNSoPqxf1xCvyhE+Om
 Xrl9IzNxqBI0ywfndicASmRkfDjo/mJa/xKIJ42ZhVwLCfW6GLIUPgyqsxxkeyklKgiF
 4qFCiUhZtH1AcNQNYZspmskaSqqqVx9SSpbfGik4NSxruL1LZyVf1ch9COF5H4ieJR2x
 YkXahO+J3m4p9T6R+a9DfL/uJB8PWRuv3icJJsBuVwpwLeahwZNSm7r1EeK9Z/lTot9y
 ZJJQ==
X-Gm-Message-State: AOJu0YwMdFU5evsjX9sLzxb403xlrS3HtQqZCVx9pkIqWtXfyc6DGF81
 7TYtuWM2nkfS6hdeXDWzs5Ac21KtFUONClprEYaXuUAS4PPle15Edhn21u98Z+o=
X-Gm-Gg: ASbGncuyXK5wV5OsJrTcP0w8BPtmjGOQPKFFKdI7GE0R9TYL8/U2nQFNpbxbM1H/yBO
 IUxW13tiqOeyaJrQVW2TmPXysnj3v6ENfsW9yPXCeXW/CjMe7PdoVigTGph3GqCHKqmrVMFP1xI
 bKXinEIBh0iyb2p21eZ/Ro8RnIjnQlmphgcYYwLLpC3SbQLz3z6482gZWSFVd3rfojCLKhslNLY
 Wj5L56lGfIQrmDaJ6s5U0YK3OdcP43rPmzMSJl5CXlHNHWbed+CIPCCkpY=
X-Google-Smtp-Source: AGHT+IGrcAC02vTQPlcacYUTbvLQs7XYAEzeWoxv2L/xxj+FH6ETaV+NC4PqRcJl3UltbyTxJZKdpA==
X-Received: by 2002:a05:6871:5297:b0:29d:c870:74 with SMTP id
 586e51a60fabf-2aa06922f71mr18633110fac.27.1736966620062; 
 Wed, 15 Jan 2025 10:43:40 -0800 (PST)
Received: from grind.. ([191.202.238.10]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2ad80a5cb64sm6539196fac.47.2025.01.15.10.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 10:43:39 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 ajones@ventanamicro.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 4/6] target/riscv: change priv_ver check in
 validate_profile()
Date: Wed, 15 Jan 2025 15:43:14 -0300
Message-ID: <20250115184316.2344583-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250115184316.2344583-1-dbarboza@ventanamicro.com>
References: <20250115184316.2344583-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The S profiles do a priv_ver check during validation to see if the
running priv_ver is compatible with it. This check is done by comparing
if the running priv_ver is equal to the priv_ver the profile specifies.

There is an universe where we added RVA23S64 support based on both
RVA23U64 and RVA22S64 and this error is being thrown:

qemu-system-riscv64: warning: Profile rva22s64 requires
    priv spec v1.12.0, but priv ver v1.13.0 was set

We're enabling RVA22S64 (priv_ver 1.12) as a dependency of RVA23S64
(priv_ver 1.13) and complaining to users about what we did ourselves.

There's no drawback in allowing a profile to run in an env that has a
priv_ver newer than it's required by it. So, like Hiro Nakamura saves
the future by changing the past, change the priv_ver check now to allow
profiles to run in a newer priv_ver. This universe will have one less
warning to deal with.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 target/riscv/tcg/tcg-cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index c060b65fbc..de2a8c3f35 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -746,7 +746,7 @@ static void riscv_cpu_validate_profile(RISCVCPU *cpu,
 #endif
 
     if (profile->priv_spec != RISCV_PROFILE_ATTR_UNUSED &&
-        profile->priv_spec != env->priv_ver) {
+        profile->priv_spec > env->priv_ver) {
         profile_impl = false;
 
         if (send_warn) {
-- 
2.47.1


