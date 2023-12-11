Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F850C4167D
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 21:27:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rCniN-0001W5-R7; Mon, 11 Dec 2023 16:21:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rCniE-0001D5-NK
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:21:16 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rCniB-0005R2-9n
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:21:14 -0500
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a1f8a1e9637so424808866b.1
 for <qemu-riscv@nongnu.org>; Mon, 11 Dec 2023 13:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702329670; x=1702934470; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WbDQbeYc3MqbJhEQi67twemcgBt5US82mKEOXjqMt3c=;
 b=bu83fq66c3y8COUJQE/1HYDTWJBAj8oK7R9gJtR8+C1t/KaOAzRszW2erbuUnI6b55
 OFJ6jOSo89aMtGE9T8XQG/X1TcRnS1GHF8o0utDxq3RBraquD4FeP+NewW4NW0NQqe8e
 Cgvehdyxlzfo7igd/CI6mOY42FmBJE0wfMn8dWYMAyLipP1Pl8JyXk4cveJ4kCMoSLnf
 lUyXg6e8WufGTxMWgdahTyUYJqCxAfJD3vzr0nUsA2I78y3ENvkESPDmBqGmvDl29R7w
 wJVzgm6nV3BWFimhaxy2LMbuxgtM828C9/vTPRB1TWQuPQDdj/fhjKN0VsnidOKaL+J3
 kwyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702329670; x=1702934470;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WbDQbeYc3MqbJhEQi67twemcgBt5US82mKEOXjqMt3c=;
 b=Os9j69hKq8QJwyvN7z2HZ74bR35LZCCmnAdIzeZi1x+o8lhctXNjK8t7S6rpIqmnt7
 /aYBY3zDp+2EgMCrSM1Obdw+MrScI5N63qHATG31CzfmNzOX+K+xqG3IINkR98kxzWDx
 wpgn7Acyv8FB3v/ujgqjcVtOjAL7cE5RDMi+QRDtg9uNBFzkdZlyy+lHDbLdnz4AZYRd
 9GnO/l5URbYTtCOVtYwOHw4fYRZ1xHvk1Fjvg/LBFXtmNnfveh+knnPMKPWXj8dM1f7K
 QpBPHSaxIhk7v+q1UdtA224sj/LRI2nggXh7O2szchShKLJLxKnpCvbzq8rcsro4//vj
 L8xA==
X-Gm-Message-State: AOJu0YwTFSSB+XUJgF3ET1/PTK5lrc374hPF35N7eANl8Nl/cdE2n+Tk
 jn7mTq+k7lJLJEBiv+ACSGE8H0khp3FD/YZ+7RxtEw==
X-Google-Smtp-Source: AGHT+IHqm4UZ94oft03ymzOFSZfr6wL2NQDR25w3u0JiNetMo2FIb4m6lHXBdEO0USlv9SICLLe3wg==
X-Received: by 2002:a17:907:c08:b0:a1f:9842:5a4b with SMTP id
 ga8-20020a1709070c0800b00a1f98425a4bmr3691271ejc.66.1702329669925; 
 Mon, 11 Dec 2023 13:21:09 -0800 (PST)
Received: from m1x-phil.lan ([176.176.175.193])
 by smtp.gmail.com with ESMTPSA id
 vh9-20020a170907d38900b00a1d18c142eesm5352528ejc.59.2023.12.11.13.21.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 11 Dec 2023 13:21:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Claudio Fontana <cfontana@suse.de>,
 Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 07/24] host/load-extract: Include missing 'qemu/atomic.h' and
 'qemu/int128.h'
Date: Mon, 11 Dec 2023 22:19:44 +0100
Message-ID: <20231211212003.21686-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
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

int128_make128(), int128_getlo() and int128_urshift() are
declared in "qemu/int128.h". qatomic_read__nocheck() is
declared in "qemu/atomic.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 host/include/generic/host/load-extract-al16-al8.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/host/include/generic/host/load-extract-al16-al8.h b/host/include/generic/host/load-extract-al16-al8.h
index d95556130f..6b47339b57 100644
--- a/host/include/generic/host/load-extract-al16-al8.h
+++ b/host/include/generic/host/load-extract-al16-al8.h
@@ -8,6 +8,9 @@
 #ifndef HOST_LOAD_EXTRACT_AL16_AL8_H
 #define HOST_LOAD_EXTRACT_AL16_AL8_H
 
+#include "qemu/atomic.h"
+#include "qemu/int128.h"
+
 /**
  * load_atom_extract_al16_or_al8:
  * @pv: host address
-- 
2.41.0


