Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552CBC982FA
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 13:17:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9Mqk-0008PY-HZ; Wed, 23 Sep 2026 09:17:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9MqN-0008M6-G6
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 09:17:08 -0400
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9MqJ-0006hu-Jf
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 09:17:02 -0400
Received: by mail-dy2-x0f.google.com with SMTP id
 5a478bee46e88-33e46a156f4so529986eec.0
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 06:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790169418; x=1790774218; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2gngFNJ3Klpuiy2qgGGYHVsKQcajQAru1FZZV3MRnyY=;
 b=G0r2aAZLlX4FLaCjTpVl+oFflVeloUZI861CRkszfEt0WagrCKOuw1HDX+tDtmWbaS
 4+D7y4E8x1mVyGEa8JrTLlaXi8GHSp96rf658oUge7GfmJQ8eMvtXtq0oNSVnQBSLf69
 7T125LFFwyN9LhCYh7NW+MiJYo91jHA5MWJ0uFLTu2U4WzIZR7apf49i3au/+mTDt2nq
 /TjCq7cNYCkv5l6XVWS5B7VeoRE0kBbCf75PWysMVmO7+e78kA9y71VNbHPiIBrk888d
 9oaf3R277wivIY+b+oncF0CixliSDMXkbQ9nss/Z41yBMVHQvaBIUUHXRfWza+bTQP8R
 rBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790169418; x=1790774218;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2gngFNJ3Klpuiy2qgGGYHVsKQcajQAru1FZZV3MRnyY=;
 b=QRSnz23/WrY3HmAFDhXpXkM4DgAcxZNfOxdDCPPeYNRBhYx2ZUkVYFpsrSGQzrvi0b
 AF31RLtiralvb4jpEnoPk/LQMUqREm5HESOI0rPimmJtTwMchCRFbulTnW0EjwBYcfju
 zRl7XbnHpQJJQYaatDugCBjLOmXWh6c1BiREndkrM7fowoMTlLyaVriMsthnryXjsfJd
 j5XDKd+dGOZhl70D4K6U7JLyEQg9pAA76K/x+K0ZVNr9mOPBNFo4qJ0VlRFS8tmSRgPV
 qsJmWr9n1TurlkI2dZFIOQhVEGRf5iml82qulWAUeVDebXxGOSwou7MmqSuFjR/dFpg8
 0j8Q==
X-Forwarded-Encrypted: i=1;
 AKwUvByUg6T1AxyWFv7PQURKIvqE5nJMEeuwp9lVbqKB38TXcLA7t/cKmamSgXDRCe+g6/TWeO7A5cYKlbfX@nongnu.org
X-Gm-Message-State: AFuF++mN5e/V5W8iziJfeD1a879msAf6KUk3uEKZvKGgWJOFqV6o8JqM
 U+U1P5/GleMfrMwR6rWml7smVXbcG9e86nmFBj8Kcn/PGrWNUb4SfrsT
X-Gm-Gg: AYBFou0Fwi2/IpbcUpBLJD5k26h1sPUiKtK1QkMsnhgV2WWwbelaxwhLQ7fuwQPz6zy
 Kvq83vgkSkn9j+gjIRDooX8lpQuDeQMHaXUHljhPmTMj6SoJKlql90PlMJf9FMxlHery0VUZjGa
 lA3A8ZJujHzmAaCQDD1WRt46Pep0G5xN7m+3Fjr5xbwl99lAKKo0z9z+RJSwfnXQ3H93ERgD0rI
 SFcmydrSJPDQkHFVjFve0uYW3x66IpSP16r/hbIWrzzp/+Lc/criM9+J3Dp9JlA/EoWiOGKiHqI
 m7qaDXBnA1+vOlDZCYIW1U2c9kJV3pRilRVlvhXP5M8YqYJwHrrjw9urTXprXeF4YOBEZNObTI9
 uBnJZSNoykK5LFRbLJLJP+kzstL9ubtXADfLtqiGLT6yst4xY9qhXTN5Or38GHOixSWsutTlkm2
 FTkN8bg9NBLlI/78EWyT0oyWk4IVtb++PTmVB9Mce83h/UHboLp64ssUoDhmvc4unumEhQfy0sv
 T8Gmdao20Bojnd8IkfLUxO7o44yhmqKmjjurdUuJg==
X-Received: by 2002:a05:693c:8808:10b0:33e:6b65:5eab with SMTP id
 5a478bee46e88-33e8ddbef60mr2484078eec.26.1790169417968; 
 Wed, 23 Sep 2026 06:16:57 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:16:55 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, xen-devel@lists.xenproject.org,
 Chao Liu <chao.liu@processmission.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Fabiano Rosas <farosas@suse.de>, Xianglai Li <lixianglai@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bibo Mao <maobibo@loongson.cn>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 kvm@vger.kernel.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Song Gao <17746591750@163.com>, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH v3 001/114] meson: stale qemu-version.h only when .git exists
Date: Wed, 23 Sep 2026 21:14:35 +0800
Message-ID: <20260923131635.1894-2-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::f;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

build_always_stale for qemu-version.h is fs.exists on the source
.git. Matches qemu-version.sh, so a tree without git does not
regenerate the header on every ninja.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index cfac634cf13..f17665c667d 100644
--- a/meson.build
+++ b/meson.build
@@ -3546,7 +3546,7 @@ qemu_version = custom_target('qemu-version.h',
                              command: qemu_version_cmd,
                              capture: true,
                              build_by_default: true,
-                             build_always_stale: true)
+                             build_always_stale: fs.exists(meson.current_source_dir() / '.git'))
 genh += qemu_version
 
 hxdep = []
-- 
2.52.0.windows.1


