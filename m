Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BCEC41535
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 12:27:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r0LAx-0000nQ-TB; Tue, 07 Nov 2023 07:27:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0LAB-0007Wl-AH
 for qemu-riscv@nongnu.org; Tue, 07 Nov 2023 07:26:36 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0LA1-0005Mz-77
 for qemu-riscv@nongnu.org; Tue, 07 Nov 2023 07:26:34 -0500
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9d224dca585so850321966b.1
 for <qemu-riscv@nongnu.org>; Tue, 07 Nov 2023 04:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699359984; x=1699964784; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bPpjDkEUgqCeZLuJ7FjDj9Qp3yXD435hoj9y2GuMgcc=;
 b=V8aVhrGfgx39OX1v0S1sItKfH5CUDLVzn0sRdn0Le/D38biCGkycCpMb1mGGL5NEg/
 5hJy/iSYiZVA4VLXqUtwGxUn7QiWluaxymKt1UkSrKt5AC3ht1d+iz6wSBgNlW0OQn2v
 T61Sp+sDtY/GQqLY3PwS95Qhieh68QQPbNCocZbKr+amSADpd+dyFCaZFR5WdzDaoWNe
 t6EDSKLpLpEhZse9+vORYZUS4ee3/j9oRLszc9q9p9qxmB/a8aVi7Hqw3vQWOMDawGU9
 IRXOHOuQiyv+iUxcmZxGe9VQtsxt2yJcH5rtVic11Wz5mFwge0euJwkExdS15oUG6l5W
 cu3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699359984; x=1699964784;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bPpjDkEUgqCeZLuJ7FjDj9Qp3yXD435hoj9y2GuMgcc=;
 b=pkUI6jFyGf5Oo9npBslwi4VXwNzy5lEQB8piOFdzChQK7tkIPmeTwhberxu+UQH9Mj
 df7hS3lunMvwYSL984P6CcwiVqFBXNN8+p+Oa78rzYAbk2m10HjUVcr2AjWWF82F0D9T
 QN2jWjV/svQyGqXGHcpT1uwJcn5C2Q/q8NVWgXnt8iC4sn1XH4e0z66HCjt58kr3zMhC
 R51wcjIDNeS/t9+vwKf0tWStok6M28KdtDn1KVUpDHxw6yBK2kp8STClM/62a4d6Fwxk
 8OUmpJu6+Fc3G1ULbXrR5JQTPNdWfIMFFF97fQ4PAlNK2S1EqrguHW6DQFRsGKEdwgcS
 eJwA==
X-Gm-Message-State: AOJu0Yy2KjLOtn0nNFKO90JpsvPYZix7MVSIhmFYiasJCNjw/o818Wf9
 zfLYYOWz49MVmXUiRVgoXEhxSA==
X-Google-Smtp-Source: AGHT+IHxpB6kgb0WTfTgGc+1bi7cqwZO6ngXV2cZun9HcsMF3ctSTQNPDcuJp0UjFYxIpufELGYkUg==
X-Received: by 2002:a17:907:31c3:b0:9c7:db3:8b31 with SMTP id
 xf3-20020a17090731c300b009c70db38b31mr19724449ejb.59.1699359983864; 
 Tue, 07 Nov 2023 04:26:23 -0800 (PST)
Received: from m1x-phil.lan ([176.187.216.69])
 by smtp.gmail.com with ESMTPSA id
 gz21-20020a170906f2d500b009ddcf5b07b8sm1002418ejb.148.2023.11.07.04.26.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Nov 2023 04:26:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 Zongmin Zhou <min_halo@163.com>, Zongmin Zhou <zhouzongmin@kylinos.cn>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 75/75] dump: Add close fd on error return to avoid resource leak
Date: Tue,  7 Nov 2023 13:24:41 +0100
Message-ID: <20231107122442.58674-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231107122442.58674-1-philmd@linaro.org>
References: <20231107122442.58674-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Zongmin Zhou <min_halo@163.com>

Reported-by: Coverity CID 1523842 (RESOURCE_LEAK)
Fixes: e6549197f7 ("dump: Add command interface for kdump-raw formats")
Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231107024417.585475-1-min_halo@163.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 dump/dump.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/dump/dump.c b/dump/dump.c
index 1c304cadfd..ad5294e853 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -2160,6 +2160,7 @@ void qmp_dump_guest_memory(bool paging, const char *protocol,
         return;
     }
     if (kdump_raw && lseek(fd, 0, SEEK_CUR) == (off_t) -1) {
+        close(fd);
         error_setg(errp, "kdump-raw formats require a seekable file");
         return;
     }
-- 
2.41.0


