Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE37DCAC592
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 09:39:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v0czw-0002Uq-4g; Mon, 22 Sep 2025 05:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0czD-00024D-9C
 for qemu-riscv@nongnu.org; Mon, 22 Sep 2025 05:37:31 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0cz4-0000cN-1a
 for qemu-riscv@nongnu.org; Mon, 22 Sep 2025 05:37:30 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3f42b54d1b9so1466511f8f.0
 for <qemu-riscv@nongnu.org>; Mon, 22 Sep 2025 02:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758533835; x=1759138635; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p7AJahUMqP4H52ZjgDIGUlzyg5ExoTqCJvWrQsOM+Os=;
 b=Bg/SRRFWdo1eoN1rrUiX+oMyQW5KptzRh/TvTfXBdhYWtscq65fuWo4pfjWACOWc0G
 MuEvFRbVQZ2CeQOJtSlBe09oJuiF4og/q2AEL9lAo+dAVSh9CKejD1XM9zKQWIF9FHt0
 IbEW/KERg5mq1LEJVdj9lYPxp9Gt2VXM6zpN9g/jEKejFJsZKzETa0dIGPhVpfqjMHmN
 lnI3DbL3mBVrn6zVTmmo7tOwXZBfeDuRe9R3Q6joQ3AXVRm1/KQUeZICju66YiH0PDvF
 TRa4di5yce/gtTtpzrJ/bB+aGTRO+azqbJk76AJoRlB9Lqt6vkegECf/HG8CAWeS4oou
 03MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758533835; x=1759138635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p7AJahUMqP4H52ZjgDIGUlzyg5ExoTqCJvWrQsOM+Os=;
 b=q+WvW7f5a12blOWWH/EHFDStKQa6usrZhoGnAjIH99j7MHF488oG4nX2QWte7IQli4
 +TXrS/JBhQ+L6/rwrakjWC+2GNxLiMfwprSAMiR97xbd0U7ez6MqXGI+qu9DV/poeVel
 NlesqRDTstfY2U9Oo0H9CkNZGEaXaOMyNg0I10GvjSlj6pCFS7598RCOKyTnc/o1hWI+
 DlC03E2WICd3Iivx4GL5yugkdvDOAPled2SN/JjJGYRiLnymdMdRgdp5jYo1T2tQ2VSw
 wRnEkn2/8+E1zsyPcXLlgXnK61baDjDlQaVPtCZzvKAkFN6I78WJlSOCs8Z9wXA8uMvY
 C/zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWewkQCcAQ/ECp4+yepcMdbqCSFh7aHkk/N+cz1K5tvbwhv4kJcQ2oJ8tTcfzgkaekVuyuFrVu8Xd86@nongnu.org
X-Gm-Message-State: AOJu0Yz3hYXDLDi4WsAzoLhaDziEqsU+extQifDpBJNhr77+Y5sso1+w
 AsPK2L0h8Pp06IOl+D0SvtZs/sjT4LisXnYXDJ1g3npkQwHsNx79A/DgzgqyQRYDLiU=
X-Gm-Gg: ASbGncsRgBFmGNCDHobLP51ZfqF6/9GVQ0i0l8HYxilLBmbAWYJyG6TWFwfYw3Ayr+M
 cvrEEOfRDJT+s6i8teu+Cib4anTYaZTgCusS2XRwaT6JWadxj7+fgVM0EmjIGRNrSAagLCZuE2/
 n79JWNmdMdX1RzRCsar4BVIDgpkJ65PB3fm2XVvDVUxPCfcxcQBqAnfbgWgZryuYWhtxNFVRbEm
 DRZR7K1zO+qh/NghHaSv/iC0RqFkrSK1xrarZD4wq1clucs68jjaK9sxsJI88NmVxX9JvD43Snl
 Qvp0oH/Tkaxvf8d3C+h4HmM4eRwXhVCUrAoSiw1j4NFnseR0bUDkvYSkJ+iVdZEurHz+LjThQMz
 pDOl/kCVyaujJ2DU/GZUsjWo=
X-Google-Smtp-Source: AGHT+IEKJ52MYarnP5WeS3Ssw0avY2ayMO6o3vcUndbtS7T5aj3s7MrMaJEPUYVs8MIw5X3I4Ev1pw==
X-Received: by 2002:a05:6000:2c05:b0:3eb:2428:4a05 with SMTP id
 ffacd0b85a97d-3ee7bad11fdmr11043020f8f.3.1758533834747; 
 Mon, 22 Sep 2025 02:37:14 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee0fbd63a2sm19048919f8f.48.2025.09.22.02.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 02:37:12 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id C3D4D5F90D;
 Mon, 22 Sep 2025 10:37:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Nabih Estefan <nabihestefan@google.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 03/25] checkpatch: Ignore removed lines in license check
Date: Mon, 22 Sep 2025 10:36:48 +0100
Message-ID: <20250922093711.2768983-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250922093711.2768983-1-alex.bennee@linaro.org>
References: <20250922093711.2768983-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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

From: Nabih Estefan <nabihestefan@google.com>

When running the license check, if we are updating a license it is
possible for the checkpatch script to test against old license lines
instead of newer ones, since the removal lines appear before the
addition lines in a .patch file.

Fix this by skipping over lines that start with "-" in the checkpatch
script.

Signed-off-by: Nabih Estefan <nabihestefan@google.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-ID: <20250916165928.10048-1-nabihestefan@google.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/checkpatch.pl | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 91616c974f2..40b6955c698 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1816,7 +1816,8 @@ sub process {
 		}
 
 # Check SPDX-License-Identifier references a permitted license
-		if ($rawline =~ m,SPDX-License-Identifier: (.*?)(\*/)?\s*$,) {
+		if (($rawline =~ m,SPDX-License-Identifier: (.*?)(\*/)?\s*$,) &&
+			$rawline !~ /^-/) {
 			$fileinfo->{facts}->{sawspdx} = 1;
 			&checkspdx($realfile, $1);
 		}
-- 
2.47.3


