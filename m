Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB455D6ACE4
	for <qemu-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 15:07:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tGJbl-00008A-Tj; Wed, 27 Nov 2024 10:05:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tGJb3-0007Uz-RB
 for qemu-riscv@nongnu.org; Wed, 27 Nov 2024 10:04:58 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tGJaz-0007aB-JH
 for qemu-riscv@nongnu.org; Wed, 27 Nov 2024 10:04:51 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3823eb7ba72so4719425f8f.0
 for <qemu-riscv@nongnu.org>; Wed, 27 Nov 2024 07:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1732719886; x=1733324686;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xwfJKS/UmNk6H202tZ95ZsNatmfeqYn1XDsf0iNj28I=;
 b=YkVnGncwksD5udYFw8q7VAItJoF+n/nUgUbEGA9ZFdAZHF2FVnp1neQJyyEeYuuPWK
 xfe8htAvAni0Uq08NJrzWTQc5XaWsR8oQLynXqs/4p2bMDuDS0+NTGeH2Y4Lr1qIK3M1
 eSt5jmqvf6e32ZxZphfToHKGRD6/vMwTNtDQYIFt5pxWvzb/SrYjquoupfngd9lEpl06
 j0emxdEMPTLnvaXQqCKGPjnFCe0+KYuYZxJNbO7Y0YGhTHppCPCHOMya++gEzbznfGcg
 uhw8tcnFk2a++T2rbwXQ+dVaOC4DAW/SAqSq97DntBvoUcZpHRZhOSSsHVlIe8dE9Psm
 L4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732719886; x=1733324686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xwfJKS/UmNk6H202tZ95ZsNatmfeqYn1XDsf0iNj28I=;
 b=b9CcUHBqD3Q8abEl4ADRavfYhmcD163Ud8BJhAojQxMMi1PXqpRN2A5x3F+cuKmeF8
 BZSUOmIqSM+e9S2ebD9HK4Tl3tbTtJ+Ol8E0d1wFLnc4kiXk+nVAe/ZH05KgxyAqVNlx
 Hjw9AjjiTKmgbVtwo35PldOT0Dtk+GRe1pmX4BkqnlYtuQTFle9hD7JIV8GDcnAnxesK
 71XWF8BywCjyXMklOAIairley+TCv2npeOHICU4m64I9kmcZhmLDVW+Y/F7hcbuFRLem
 WsVGLpxMfjsL+vJ6Eg75u5D3Qm0hiht/U6UowlI44IbekcGSysiMuhaNNOmTYnaNaLaQ
 YgZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEwr9ef6FP+3XZhl9o5G8qcnGYD5/anepyp02UQdKAY206lMIjkLh7KdlNqutDK+OSLYueXCNFbKWk@nongnu.org
X-Gm-Message-State: AOJu0Yx992LY4StBqnLqnRzyaV0sJmWgY7B2hheDf7B2pageigCcqPE5
 XKi9ZHa/Dd3Fh/Tts+m4r3yUicvYbo2Z3ghJ2r5YYUr6FEzm58JWsuL6vusLMg==
X-Gm-Gg: ASbGnct4wyrDy7tNWkl9x/XXRiyNc5SVBL71AO0ARlzObpu6YOgb6IfyMqMzvpVNbro
 6nOzNSEPituDXLXx2kOgVs/HR0vp+KKflfk3HcXWFkD8xdH3xP6xM2HJQkmAi1eKtHWvd8OZ61b
 SMphKf1C/HTgB/5uvA0j/9bbcRrKipwSNDSZWGEILVPRihLdTUWLUPtoARKeYO4BTjprRZhDJbC
 mK2t5fktWTTxnWKTXVjP03JEtcjq2XKd/1pict0/42RSzrW3faJxx1ftQ5VxhnpuUOeOozpA8GY
 6Zx/no4LCRX1J3sWFSzvmSwvUw==
X-Google-Smtp-Source: AGHT+IEVp443AwDo6VROiWm7lIUpS43bMPqBLo4fh4FR+P6gVHZgpIPv3I6Kzb/Fn/OiFM8UoXNn3Q==
X-Received: by 2002:a05:6000:2ae:b0:382:40ef:431c with SMTP id
 ffacd0b85a97d-385c6edd9a9mr2970786f8f.37.1732719859747; 
 Wed, 27 Nov 2024 07:04:19 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434aa7e256esm23339155e9.32.2024.11.27.07.04.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 27 Nov 2024 07:04:19 -0800 (PST)
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
Subject: [PATCH v11 05/15] MAINTAINERS: Add myself as maintainer for apple-gfx,
 reviewer for HVF
Date: Wed, 27 Nov 2024 16:02:39 +0100
Message-Id: <20241127150249.50767-6-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241127150249.50767-1-phil@philjordan.eu>
References: <20241127150249.50767-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::42a;
 envelope-from=phil@philjordan.eu; helo=mail-wr1-x42a.google.com
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

I anticipate that the resulting workload should be covered by the
funding I'm receiving for improving Qemu in combination with macOS. As
of right now this runs out at the end of 2024; I expect the workload on
apple-gfx should be relatively minor and manageable in my spare time
beyond that. I may have to remove myself from more general HVF duties
once the contract runs out if it's more than I can manage.

Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
Reviewed-by: Roman Bolshakov <rbolshakov@ddn.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2b1c4abed65..08780eca5d1 100644
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
@@ -2610,6 +2612,11 @@ F: hw/display/edid*
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


