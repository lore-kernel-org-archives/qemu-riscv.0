Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mURkx-0007tL-42
	for mharc-qemu-riscv@gnu.org; Sun, 26 Sep 2021 06:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mURjg-000743-67; Sun, 26 Sep 2021 06:50:23 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:35663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mURjc-0004lg-1Q; Sun, 26 Sep 2021 06:50:18 -0400
Received: by mail-pg1-x531.google.com with SMTP id e7so14918949pgk.2;
 Sun, 26 Sep 2021 03:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=whagkWhHtXafiUj9cJXVys9f0WWXSEBm/lY0x3a3tBo=;
 b=U1sTe+1T+VFzejbt19zP68laHDQf5VGDNk2hf7X9IiqtwQC30OPJ05gvGvvTiu3b16
 0WgQCngoAMg36cNq2TZ9AB8pDYPETMBZHafG+cbPkhS3MlsHSoWLmgEiqvipJziSPC+x
 tCg8DnXH5ivPq9gHoAHv6fXQRn9RuyP9zWYC4zEeTo0qPMJBlIk3xWAVVviUBOtz5DMn
 fFB3WT0vPEvo5f2+03dUyQSb/lcqo0Gj5JWCCFBvW0Sp2rSgyOts2wW1OaAjVifUPVH5
 sZ7PpgX1gOhaKB0Y7+CzCcdtBkLZ2wNYmnhRz+rizfNU/SdwDRda4KnckCiaB2pYvVef
 t1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=whagkWhHtXafiUj9cJXVys9f0WWXSEBm/lY0x3a3tBo=;
 b=lpBJwk5kvYahtxGf9l3vUmlXuaAfNHkBq/zkgR3K2RVJI+CskWz2Yqux98yyhawbNb
 YjPBEm5JJva/aUjKprLxaKuX/zNrzlK1nMESILo8IdoWPFnbiOqCdIYKB893dDnR/vLk
 gGWcgsKVb5vf9dyXUoNvAJyAHlO0pP3vWuzJioxFrrirkOVTic4G2nFWVu51onc5gMsF
 5rwxrGrToat3VpQoCuUYBkhU5KMXkdnWxfmG5Ieohiem+NxzemQduJs6UEpBOoqZMGoI
 2x9h1pjPH9M7gVVe02cMGJcnno4HiAyrnLKwGPgWFCYLJ0gCO62nim0nwMhOKi4rTpHn
 tBGA==
X-Gm-Message-State: AOAM530EcSC4WLlGMJILLUD6Bmq95wYPi3CRErsKWtyRRntyDfrqnbjE
 b9o/PZ1mzTvxtVXYs7UCER0=
X-Google-Smtp-Source: ABdhPJzSifyise4NTcuHqlh24PKUf7gOMrjU3eSwntBzW/E3VuMHlWECl4jJbWCJ8wo+Ux/ZOJsnoA==
X-Received: by 2002:a05:6a00:4:b0:43d:32f3:e861 with SMTP id
 h4-20020a056a00000400b0043d32f3e861mr18322843pfk.60.1632653414430; 
 Sun, 26 Sep 2021 03:50:14 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id y13sm16190562pjr.1.2021.09.26.03.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 03:50:14 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 2/3] hw/char: shakti_uart: Register device in 'input' category
Date: Sun, 26 Sep 2021 18:50:02 +0800
Message-Id: <20210926105003.2716-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210926105003.2716-1-bmeng.cn@gmail.com>
References: <20210926105003.2716-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 26 Sep 2021 10:50:27 -0000

The category of shakti_uart device is not set. Put it into the
'input' category.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/char/shakti_uart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/char/shakti_uart.c b/hw/char/shakti_uart.c
index 6870821325..98b142c7df 100644
--- a/hw/char/shakti_uart.c
+++ b/hw/char/shakti_uart.c
@@ -168,6 +168,7 @@ static void shakti_uart_class_init(ObjectClass *klass, void *data)
     dc->reset = shakti_uart_reset;
     dc->realize = shakti_uart_realize;
     device_class_set_props(dc, shakti_uart_properties);
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
 
 static const TypeInfo shakti_uart_info = {
-- 
2.25.1


