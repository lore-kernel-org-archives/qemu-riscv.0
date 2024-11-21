Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E9AD78799
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Nov 2024 17:06:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tEAWT-0005l3-4S; Thu, 21 Nov 2024 11:59:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVo-0004n6-7i
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 11:58:37 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAVW-00083q-0R
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 11:58:35 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43155abaf0bso9861155e9.0
 for <qemu-riscv@nongnu.org>; Thu, 21 Nov 2024 08:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732208296; x=1732813096; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nh1HSCE0LYEGDQ7X1d/mpdCNk3qVcIIVFU2nc2OFGiU=;
 b=ZKHge06xXU6MZrVT9TqS6+IbdPLQp1KUiJnIQKDsDHCJqp6cdjshAZdiRBL63CMzpb
 bZS3DETY776OCU2HIFes4MDXlPSOlWiyuatX40GXzcteSYTLT9jt3K5MhVSdCAlt5MKr
 Fu0+NEB9u0N93S7Ua182Nnl5zn5EsHyyCesKOodmesn34bdhfBFGjTuuPiPuGJs/3ryI
 wMhZ6kzfZe12RJtWSZ4Ys6SUQs/M2FzPQ/bMiyredIFKdqeXwoXVsd5SOT0VyvABR31F
 Nv9rck7eQenBXK798SrJ28FZ6ba0Ukwk9C52INTg2JyJap1xF83UHHnPwI+Pj7feUD4N
 NE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732208296; x=1732813096;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nh1HSCE0LYEGDQ7X1d/mpdCNk3qVcIIVFU2nc2OFGiU=;
 b=hgkpXjVgbcVxfM3ZuMNWhsemqLLkun45cEsT0y7clYr7YYC13JVUv/aZSbnbMUcnIo
 Hz2/I01w3aQYhpXjZ4GdLTinEGm9dbJlb2n44xcrulfJk8VxP5qMsdOKIv45Lb6dikL7
 aQhlUVUXJOp+OLJVLcRUVAXKjq8y5ghZXycjWUJmYe1XJzAQj5cP5ZSWNtqlNwtXGzbW
 dZWzUECyCg+7c/n3icDYSbo511fW8AhIhMsMj/DUROXIvt22kpFE7LFLLflcX+Js0Vi5
 0lEqrvEP+wHHpSpM16Ijz8LNFCjH0dpT/npDm5j1MQJylXXcWmqcSyECqQO178xApPr7
 dAZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVP28DEzQudvSW+MNdUFlqw7DnX+qhf8cQMM9pT4TCo3PShnuAxm/+g3Q91nRLdLfhNnFLWlN4f5H98@nongnu.org
X-Gm-Message-State: AOJu0Ywyd3l7gJPStDymP5YCfzJn1pU4myLg5c7MHUkUjx2dvVpkoopO
 Lv6LqiETBAhbevJ5GKUkERgW/I2NtWQlq3MakV+SvhciswED6YZ2FSAa5XqqDlc=
X-Gm-Gg: ASbGncvX3oI7Jq8UC/OWmkVa0yaPN+tDeegoFIa3Qw8zDC6+5+iF555SManS97sPU1M
 rLjkzsTyaMlFu9kyMNuuGSxa9yi2lcnbbzx3yCAO16zNmdguCfJH0Ng0gwgTurowA7iid/Ynurg
 fixNa8+cdGKdu9dt+ZuglENBOd6jDs4Ha7FH0uSVXdixTbRiW+63aNUzoYaUSMC9C5QDSd9KHCb
 QvNVveMn7SrCVvnGJCPKYwRPhQNXGhFEfQfpejfVfYeqMBG
X-Google-Smtp-Source: AGHT+IFMIRIvLgYx/NGn8gGlDiVz6YLvmj7b0egaaZ7PnQ+VQYm4uHamdyPY85H4BIrE6JL/kr+Z0w==
X-Received: by 2002:a5d:6489:0:b0:382:4ff5:61f with SMTP id
 ffacd0b85a97d-38254b28759mr6329427f8f.59.1732208295832; 
 Thu, 21 Nov 2024 08:58:15 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fb25d74sm31746f8f.47.2024.11.21.08.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 08:58:14 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A119E603D2;
 Thu, 21 Nov 2024 16:58:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>, Bernhard Beschow <shentey@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-s390x@nongnu.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-rust@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Markus Armbruster <armbru@redhat.com>,
 Weiwei Li <liwei1518@gmail.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <anisinha@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 13/39] tests/functional: don't try to wait for the empty string
Date: Thu, 21 Nov 2024 16:57:40 +0000
Message-Id: <20241121165806.476008-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Daniel P. Berrangé <berrange@redhat.com>

Telling exec_command_wand_wait_for_pattern to wait for the empty
string does not make any conceptual sense, as a check for empty
string will always succeed. It makes even less sense when followed
by a call to wait_for_console_pattern() with a real match.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20241121154218.1423005-14-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/test_virtio_gpu.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/functional/test_virtio_gpu.py b/tests/functional/test_virtio_gpu.py
index 441cbdcf2d..d5027487ac 100755
--- a/tests/functional/test_virtio_gpu.py
+++ b/tests/functional/test_virtio_gpu.py
@@ -80,9 +80,8 @@ def test_virtio_vga_virgl(self):
 
         self.wait_for_console_pattern("as init process")
         exec_command_and_wait_for_pattern(
-            self, "/usr/sbin/modprobe virtio_gpu", ""
+            self, "/usr/sbin/modprobe virtio_gpu", "features: +virgl +edid"
         )
-        self.wait_for_console_pattern("features: +virgl +edid")
 
     def test_vhost_user_vga_virgl(self):
         # FIXME: should check presence of vhost-user-gpu, virgl, memfd etc
-- 
2.39.5


