Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99421D7879A
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Nov 2024 17:12:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tEAdb-0008HH-Be; Thu, 21 Nov 2024 12:06:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAdZ-00088q-4v
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 12:06:37 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tEAdR-0001Zm-1R
 for qemu-riscv@nongnu.org; Thu, 21 Nov 2024 12:06:36 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4314fa33a35so9589555e9.1
 for <qemu-riscv@nongnu.org>; Thu, 21 Nov 2024 09:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732208785; x=1732813585; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=idIcVKGpYjCDsx+KcIa06gkN9HyuOLEg0Ymsw5Q1ZdE=;
 b=r782XFJHMgK5HGG2p6y6i9+BHtyGGe+0ub3KPDvw46HrVpzBG4aX8lZxtGnR7e8c9M
 h6eaDAxGr+q27dnR05IqXe3M02yQHdvqvy+P7vhT+H+nFxqYQYkIQQ3xLSZa/0olIsa2
 ijwGRpDWeK4y7A6d5mC4rkw6tBDGYUlSHrgcp04v5UWyBfAQVGpnYfbLW8/irLdGjrv4
 fShYbpuPJaEA358oBB0hWwsIt4eOJGnuQEEiNYYdBczmpD/G1JzUdy43KDu6wS1C9+TW
 HQiAzSWsxwVjEgk+FD0sUwrMXUZsQCzfuhAkJKoIe2t0SyFSlqUE3TudGf7yUh7qqsZq
 JzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732208785; x=1732813585;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=idIcVKGpYjCDsx+KcIa06gkN9HyuOLEg0Ymsw5Q1ZdE=;
 b=j2cZ6FN/Ht2qcFetMUmYc/yTbl7FgtO68u5g5sYArTVSQl3rGG4mj/zK4b6WTIJTOG
 3OQPLRW2dYyekXgJlEd5oCZVdnNG8ZYh6hTEvAVzdZUpJHR+7wIHza1k24Vylc4BW4kj
 7ZRuvynbqxmRCE//83JREDRxtl1OeGoJ0B+NUtbWuooEYAbc4lxn9lqAYQ8vq7nEW6Xs
 wUNVgYNfFELAtFDCkwF90NJXq0WdVaZcVHFtDg4eLwPyoQmvLwBwJ7pzGJR2ZTF1bHuB
 VgbDWwtY0M+2rMKxZggfszCZGBG3NzteOJA/nvM0CyCE+96XJn4QX0xvfg2e2RaQW+HE
 njRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUA3YsdhGlXFrR5Fx88nt8kMkHgC1RCH5bDo73YxOa4AYErsNh/8vFhtbrKPf7xnYfuOJQh1IKtaDGM@nongnu.org
X-Gm-Message-State: AOJu0YzsnAdKRS+3ZMZSDtQ68iilBVKeWhMDvtrlJCSDCk6WclsalLJ3
 UMYT7uBfNsBecy2D2TiNXkGLur3EzKdu81opDos44JTE8Roft6BtTFOa6gkdQeA=
X-Gm-Gg: ASbGnctnN9bkNZvnPIwHnYuZXP7cBV4fCfOx5pXCAjmsvE9a6EkJHmzBeeqReatl2GT
 xEuh5K918/GwgSLIP9crgIa+XINEpOs9At7XwJFXCOnKMvkROzZ1/JnzfhYJGoe55qLBo4a+qOJ
 AqbeKZndBxF5ODb+x8FR4xY98hiVKJlb4HgFp68F1Hp0JPBg9YTeUPDDsaKi7Xi+uNLxu+NhQi8
 77Fhls2FjpgkKK8ah9jZUf4fB0SPX0xn7U66j9jvcE/ksyR
X-Google-Smtp-Source: AGHT+IH6g5M3vTaVsS3CPENTsM7HsoWcPZRMPU6znIjdL1RjlqwiFqX8MvTPqIsvEGnUeu6izcb0BA==
X-Received: by 2002:a05:600c:c84:b0:431:5ed4:7e7d with SMTP id
 5b1f17b1804b1-433489d4d91mr68172095e9.18.1732208784265; 
 Thu, 21 Nov 2024 09:06:24 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433b46172d5sm61230635e9.23.2024.11.21.09.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 09:06:23 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 9F3BD604E1;
 Thu, 21 Nov 2024 16:58:09 +0000 (GMT)
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
Subject: [PATCH 35/39] plugins: add missing export for qemu_plugin_num_vcpus
Date: Thu, 21 Nov 2024 16:58:02 +0000
Message-Id: <20241121165806.476008-36-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121165806.476008-1-alex.bennee@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Fixes: 4a448b148ca ("plugins: add qemu_plugin_num_vcpus function")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-Id: <20241112212622.3590693-2-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/qemu-plugin.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 622c9a0232..0fba36ae02 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -803,6 +803,7 @@ void qemu_plugin_register_atexit_cb(qemu_plugin_id_t id,
                                     qemu_plugin_udata_cb_t cb, void *userdata);
 
 /* returns how many vcpus were started at this point */
+QEMU_PLUGIN_API
 int qemu_plugin_num_vcpus(void);
 
 /**
-- 
2.39.5


