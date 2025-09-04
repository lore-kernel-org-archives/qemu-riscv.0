Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA38CA1013
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 08:17:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uu54P-00062S-7A; Thu, 04 Sep 2025 04:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54N-0005zm-2R
 for qemu-riscv@nongnu.org; Thu, 04 Sep 2025 04:11:47 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54D-0003xt-Is
 for qemu-riscv@nongnu.org; Thu, 04 Sep 2025 04:11:46 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b042cc3954fso129230966b.0
 for <qemu-riscv@nongnu.org>; Thu, 04 Sep 2025 01:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973496; x=1757578296; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wv6wFcI7G6DdUK88SJsbLfMk3oLK1TTP1R3ujLyoIqI=;
 b=xND+ov8P5ZGHcV+/GUR6bYVVW/kDrnqx9OdTmD2lEtbKBiz4kdH43aFg5jj1zD7BXY
 YvV2pTdq4ND9bLAUUTo0YTcojSdb5doPjPpsQA3SCQx9VBASE7zw5Yji0DhWXJ4TYLTB
 4e0mfeuiDaUIPuzygT/7L284IcYAuiACsrDoIpoQcRBE6oGncIGkveTbBEPIuuMEqOoW
 s7YCKNTVVF3q60ECjtsa9O3lL6u2p+wa3TUFytmk53K/5d1O0FiS2dCw14yRD0SNy719
 0nxjtUwrct++lR7VP+2OYkbUk6pH7z9wzAZvITB3A+GYXSlbuJgg2Laizv3yz0YvF7Lr
 HhLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973496; x=1757578296;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wv6wFcI7G6DdUK88SJsbLfMk3oLK1TTP1R3ujLyoIqI=;
 b=gQj7uS1jMLKFFuPvq4zfik70eNUKFHcskm5HXI0Ws3Oh5pHo8rlBQmoDr92iJbDPvV
 b+vD+FkJZZVkdlqnHhI/+n0d9SbW6p7ZLb1JVqLVJmV98XQN4kQlyGhtYRNMw1AfR374
 VKRs3bxa/TEslrJR3VvWFYgXb/hpFRr2QKvJd9W1jXG3A5K9uM9TXPvkrEVrQ2dbfVlb
 MC60DZ5UzETKGCvRNajSuoa41yBijH2pn06alq+WFk/p1ik8LgMTK/XV+43RKPW6yc3d
 ljvQ9fcO5KdDxkDOiN6t97DaDRC5Ja8D3dCVChVP1u8SnxPzlMGFAjjXkAETEkymmmBa
 KsPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMHkw0BuwmQ5EPl48+Zvxd4zaUdr0oQbEx1n55mPkl+YcvQ7sjEr2FJLPzY+fBuk4+BU5mSvtY04vD@nongnu.org
X-Gm-Message-State: AOJu0YzEicnVcxfA1BpCDI/2vFSQC15cn8XjsW4zdZMU5rrK34jVxQ3C
 5GPv8teft8cG9tXno3Xz6EYeUu6AbD2a95WRs9hWiKYp8p7Xp4dQYaexDQMMq/cdRl8=
X-Gm-Gg: ASbGncsEspbMafXPEVKXkhLxggQG55U1EDCzEQcXvGx2ZbZv6zgPXeWxIBB9S2cSxPu
 hIei4DVRdvUJAf06EEwQWlp9mSMtmz1NubRg9pdxDc5kHmNgvxvdrKY/TgT57nscaJHqq1GAiW7
 v5myDA2QC6J99YGOGE8ZSRo3kZpNFUYd1HZEnCSlo7P0CjiUTEuedefwuam+XaQYGANxwFgmVT9
 +N98rwNJf3OTCsHOo1GzX1sZkisN9RZj8LhEhLar6hOqD7cfxXnbtEotVreYAMKHmMUOefcfWxO
 C/38ZyeUT/ZiqV4IyUAMz5zTuO1gWRudXtSPyARBdhkG+lsm2HpuTKEyS5QqWZZCVQapDhyvijH
 OfvHby6Pnu+sSupYN8z8Z5A8vVlAJzITwFA==
X-Google-Smtp-Source: AGHT+IElPpn0KvMqOR0Q75Gfkj0ncOLp1bLOMMk7oeP9JIeBPVNdyXvx2TH7ciqYVtSvBIeB+x6WBg==
X-Received: by 2002:a17:906:7953:b0:b04:813e:491 with SMTP id
 a640c23a62f3a-b04813e1a1amr139359366b.12.1756973495570; 
 Thu, 04 Sep 2025 01:11:35 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0484e8a4a1sm55305766b.83.2025.09.04.01.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:11:32 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 9A3B85F92F;
 Thu, 04 Sep 2025 09:11:28 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Helge Deller <deller@gmx.de>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>,
 qemu-rust@nongnu.org, Bibo Mao <maobibo@loongson.cn>,
 qemu-riscv@nongnu.org, Thanos Makatos <thanos.makatos@nutanix.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Riku Voipio <riku.voipio@iki.fi>, Cameron Esfahani <dirty@apple.com>,
 Alexander Graf <agraf@csgraf.de>, Laurent Vivier <lvivier@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org, Stafford Horne <shorne@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, devel@lists.libvirt.org,
 Mads Ynddal <mads@ynddal.dk>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Peter Xu <peterx@redhat.com>, Jason Herne <jjherne@linux.ibm.com>,
 Michael Rolnik <mrolnik@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Kostiantyn Kostiuk <kkostiuk@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Warner Losh <imp@bsdimp.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Chinmay Rath <rathc@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, kvm@vger.kernel.org,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Michael Roth <michael.roth@amd.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, John Levon <john.levon@nutanix.com>,
 qemu-stable@nongnu.org
Subject: [PATCH v2 004/281] python: mkvenv: fix messages printed by mkvenv
Date: Thu,  4 Sep 2025 09:06:38 +0100
Message-ID: <20250904081128.1942269-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
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

From: Paolo Bonzini <pbonzini@redhat.com>

The new Matcher class does not have a __str__ implementation, and therefore
it prints the debugging representation of the internal object:

  $ ../configure --enable-rust && make qemu-system-arm --enable-download
  python determined to be '/usr/bin/python3'
  python version: Python 3.13.6
  mkvenv: Creating non-isolated virtual environment at 'pyvenv'
  mkvenv: checking for LegacyMatcher('meson>=1.5.0')
  mkvenv: checking for LegacyMatcher('pycotap>=1.1.0')

Add the method to print the nicer

  mkvenv: checking for meson>=1.5.0
  mkvenv: checking for pycotap>=1.1.0

Cc: qemu-stable@nongnu.org
Cc: John Snow <jsnow@redhat.com>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 python/scripts/mkvenv.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/python/scripts/mkvenv.py b/python/scripts/mkvenv.py
index f102527c4de..9aed266df1b 100644
--- a/python/scripts/mkvenv.py
+++ b/python/scripts/mkvenv.py
@@ -184,6 +184,10 @@ def match(self, version_str: str) -> bool:
             )
         )
 
+    def __str__(self) -> str:
+        """String representation delegated to the backend."""
+        return str(self._m)
+
     def __repr__(self) -> str:
         """Stable debug representation delegated to the backend."""
         return repr(self._m)
-- 
2.47.2


