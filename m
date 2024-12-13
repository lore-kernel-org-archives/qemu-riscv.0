Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309BDE7717F
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 15:27:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tM7TA-0007RU-7y; Fri, 13 Dec 2024 10:20:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tM7S1-0004gT-JS
 for qemu-riscv@nongnu.org; Fri, 13 Dec 2024 10:19:35 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tM7Rn-0005KB-MK
 for qemu-riscv@nongnu.org; Fri, 13 Dec 2024 10:19:32 -0500
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-aa689a37dd4so349479566b.3
 for <qemu-riscv@nongnu.org>; Fri, 13 Dec 2024 07:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1734103157; x=1734707957;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tYWLPafzihE8PDd+NR4N69DEyaMCy4jGTA3EEV2mGPo=;
 b=njNv6LB+GMtzbIVhYBUyvt/k8suSjIkWT/KUpHgE1uqstuXs/ziRjkOWPBRBJZBHY8
 z9UcKnrD7qwEczuTE+L3tQrPg+WYIDjzTDyEWsKiqFK3cy09H7NrJDBAzUI9IGWJf08/
 /nWzJ84/4+6CaIzdhAjRJHaFRG5+Wje22rIfW/gJTcKdP56KL954pPPNACxcLb3XzHeY
 dESonfk+GvOK0Wj2OFFwTNDeUyS+P2D2nMrQyJo6zINQwrQMYaCzes5sUE+9esN7EJze
 bejr55fPYiZvQfS+pS7Ow28L9BzP8vrkjVBDRhxsVYKRlLgtA9fCs9QiK8r3fe3uqRrn
 pV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734103157; x=1734707957;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tYWLPafzihE8PDd+NR4N69DEyaMCy4jGTA3EEV2mGPo=;
 b=uinXWBACvokAd0roBH84kdYeNSAeiItQqXxCF6tWZ4v3kCosm0hhSLLI3TSX+ICsfp
 VTB+gnwR96DU+HnK9mz/bVfyXBpxR6+xDpzYJfdAQL8unPxk02gj1lcp3pz/HkEH1lW9
 rEKTMm4hPewksvA+OwCkeUScVN3gJyZi9f7xiN67Ij7JeHIpA/GbhwN+4oS68X1NUbuX
 Ij4W4op4TnecfMX12JwE/I04uinH6rJauOMBg6k8YdZf8emaWaUrrKWLs+MNOpYCK2Vy
 0hIAo5Ai3Zew8I5r7fnw8DLbnRDJ00Q2Xl1AzivIXShy5v/2RqUW3ZIjjhXZj/Y9lRb5
 5fvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZC84ZP2nIqHsx1alY3hYKNsVnxKh29nhWrJO1L7dl58D0slMg4NBSD9A4gUk5+Srpa2X/gjFOfvnn@nongnu.org
X-Gm-Message-State: AOJu0Yz2Vu1X4e+gdP70qIt6C3b0vlATZt+weL9uuNlt/RFUZBeeb/0y
 99GJN4teCwY/yCbi9YtqtcttOp5W7Y7Hh6bpQP7JN2nITsbyUmMFc5bSMKFWEw==
X-Gm-Gg: ASbGnctxTSGU03XGrcnsgF/8M227Ziswnp0KJhnAb5oNTL/M/yg2GW0xNxuSaGapw2O
 xsAIFoDrnDY6DIoVqwXJiqEKvQlBoe7j2nhRRXZOHmV/gd580GvrcRRen/lYHC5cnHR6gUUlBhG
 rIEIfEKXsh464JECIoZZYBKMM8mwUwjLSql0o3LmtFMz1vZ9EqlvAPg2NmtkDzH9xJicinkAqKc
 VP11hwUEpEHar0w+wgX7pGhpDd/4mnGagqAxGpcfdTbMDi/BXhUmFC0qHJeotOzsODf34F6PR+l
 UIkxVxYP/+9RsKCdNTJUg2suFgMDDrcQ
X-Google-Smtp-Source: AGHT+IEWGnT9wmEy9eer69vv/5vspEGKmP+OX0MGpcBLvnf3wjLriL9wwBhaQ8TRndD1zeIWw8uTww==
X-Received: by 2002:a17:907:3da6:b0:aa6:79fa:b47a with SMTP id
 a640c23a62f3a-aab778c1f2emr345555966b.7.1734103157136; 
 Fri, 13 Dec 2024 07:19:17 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab8dd35b19sm29284166b.33.2024.12.13.07.19.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Dec 2024 07:19:16 -0800 (PST)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, balaton@eik.bme.hu,
 Roman Bolshakov <rbolshakov@ddn.com>
Subject: [PATCH v14 05/15] MAINTAINERS: Add myself as maintainer for apple-gfx,
 reviewer for HVF
Date: Fri, 13 Dec 2024 16:18:11 +0100
Message-Id: <20241213151821.65748-22-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241213151821.65748-1-phil@philjordan.eu>
References: <20241213151821.65748-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::62c;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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

I'm happy to take responsibility for the macOS PV graphics code. As
HVF patches don't seem to get much attention at the moment, I'm also
adding myself as designated reviewer for HVF and x86 HVF to try and
improve that.

Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
Reviewed-by: Roman Bolshakov <rbolshakov@ddn.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aaf0505a214..09899f7407e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -507,6 +507,7 @@ F: target/arm/hvf/
 X86 HVF CPUs
 M: Cameron Esfahani <dirty@apple.com>
 M: Roman Bolshakov <rbolshakov@ddn.com>
+R: Phil Dennis-Jordan <phil@philjordan.eu>
 W: https://wiki.qemu.org/Features/HVF
 S: Maintained
 F: target/i386/hvf/
@@ -514,6 +515,7 @@ F: target/i386/hvf/
 HVF
 M: Cameron Esfahani <dirty@apple.com>
 M: Roman Bolshakov <rbolshakov@ddn.com>
+R: Phil Dennis-Jordan <phil@philjordan.eu>
 W: https://wiki.qemu.org/Features/HVF
 S: Maintained
 F: accel/hvf/
@@ -2612,6 +2614,11 @@ F: hw/display/edid*
 F: include/hw/display/edid.h
 F: qemu-edid.c
 
+macOS PV Graphics (apple-gfx)
+M: Phil Dennis-Jordan <phil@philjordan.eu>
+S: Maintained
+F: hw/display/apple-gfx*
+
 PIIX4 South Bridge (i82371AB)
 M: Hervé Poussineau <hpoussin@reactos.org>
 M: Philippe Mathieu-Daudé <philmd@linaro.org>
-- 
2.39.5 (Apple Git-154)


