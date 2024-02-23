Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA42C54798
	for <qemu-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 16:43:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rdYdh-0004B9-5b; Fri, 23 Feb 2024 11:43:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rdYQU-00064s-QC
 for qemu-riscv@nongnu.org; Fri, 23 Feb 2024 11:29:31 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rdYQ3-0007IP-89
 for qemu-riscv@nongnu.org; Fri, 23 Feb 2024 11:29:27 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33aeb088324so353915f8f.2
 for <qemu-riscv@nongnu.org>; Fri, 23 Feb 2024 08:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708705734; x=1709310534; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eZ1nEd8NJNCNQAO45v/M0dXLXOT0Wd7jVxF+jov+Saw=;
 b=yKn5FcBQCRN/OpHpz80dhP9+jk7/ojGub8BfV/rLd8ovcp4NyG5JL10QwzwoLcEKPJ
 FrE0n2DjY6YzOkdO01P0B+DMg3F5Nw5UFlygWImzP2m0BhEsOy6n11OIqWUI5couFjgr
 pgXoeFx0IUt+vG1OXiZ9YYhcJ12LHBVhjvjeBLxc0nvQyxeNOmeCvOK7aD4CoSS8tGFR
 726NI3HpoDSOwUpCe57WbZUXy7whwyrYn9pNFkumeAfwCZopoyMtrgrAYIxqDiBTJo5x
 0eZCDRU0805sCOHV2PL0zQx8x+gKbTruYBEsb2py+9OLMJAt0dinmQONWMOuWQ7bPMrF
 6Geg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708705734; x=1709310534;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eZ1nEd8NJNCNQAO45v/M0dXLXOT0Wd7jVxF+jov+Saw=;
 b=sXmfSmwhSjpafKvqHcEOUtULaY6ZU6yTIs17QDiRBHqpqPuiLbWveNetWS4UeyAlfd
 N1cOZNuuf4KPt3Yn99DiGDSlFFiLbnUB6sM6kqLIlspsLBp9zSknf6NbqNk1lAYXrsxO
 pNzoq0CvTgeHfm4wukWMGhhC29SpL2/KyYuYX37h/m92W/pgr2TmQa58zxYODBdwwOi1
 WzZqkcLmn/P4o11xhwRmEVNKFAmNgSObTwYRTe7elU8/TCGhdmKeT3sEiZdDSyl8WYkY
 apNmRNBBlUrPWA5MpGwGcC76oeKLVsCdu/0Xs6PT4VLq16kul4qDEivXZzDoLGv1ei9p
 mP7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6FTLoqjEyycrFCg4syCl/78LIaEDIrRnJY+2jU6iEviqP6YrhJqT8bynubMXQ5V5HnAtuQmwTLdhwlQs/L4Mn+XrNokE=
X-Gm-Message-State: AOJu0YyQWGcdFC6tt7TD9QrPlEUbtMo9xcMRo/aiQL5cw48jshlNJmaD
 rSdvBpX31FNf2SCeVEpX79QgctuGTYuKB6ObSRymFYmNQKztUpU9/MxRp5d0M+w=
X-Google-Smtp-Source: AGHT+IGtQ7r+PsKiN7TTDfFNVR/l3E2+GQnUhzQCfFD7k86T7A/+480H+Ge5hS5H5cOB3CjUQo3ZCQ==
X-Received: by 2002:a5d:64c9:0:b0:33d:3ff4:1047 with SMTP id
 f9-20020a5d64c9000000b0033d3ff41047mr234085wri.58.1708705734493; 
 Fri, 23 Feb 2024 08:28:54 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 f11-20020adfe90b000000b0033b43a5f53csm3297803wrm.103.2024.02.23.08.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 08:28:52 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id AF2685F939;
 Fri, 23 Feb 2024 16:22:04 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, qemu-s390x@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Yanan Wang <wangyanan55@huawei.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Cleber Rosa <crosa@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, John Snow <jsnow@redhat.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Brian Cain <bcain@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Michael Rolnik <mrolnik@gmail.com>
Subject: [PATCH v2 23/27] contrib/plugins: fix imatch
Date: Fri, 23 Feb 2024 16:21:58 +0000
Message-Id: <20240223162202.1936541-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240223162202.1936541-1-alex.bennee@linaro.org>
References: <20240223162202.1936541-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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

We can't directly save the ephemeral imatch from argv as that memory
will get recycled.

Message-Id: <20240103173349.398526-40-alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 contrib/plugins/execlog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/plugins/execlog.c b/contrib/plugins/execlog.c
index 82dc2f584e2..f262e5555eb 100644
--- a/contrib/plugins/execlog.c
+++ b/contrib/plugins/execlog.c
@@ -199,7 +199,7 @@ static void parse_insn_match(char *match)
     if (!imatches) {
         imatches = g_ptr_array_new();
     }
-    g_ptr_array_add(imatches, match);
+    g_ptr_array_add(imatches, g_strdup(match));
 }
 
 static void parse_vaddr_match(char *match)
-- 
2.39.2


