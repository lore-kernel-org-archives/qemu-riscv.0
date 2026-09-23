Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CCCC9830C
	for <qemu-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 13:28:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x9MzA-00034R-Ve; Wed, 23 Sep 2026 09:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9MvJ-0003fQ-N4
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 09:22:10 -0400
Received: from mail-dy2-x29.google.com ([2607:f8b0:4864:36::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9MvH-0007gl-VN
 for qemu-riscv@nongnu.org; Wed, 23 Sep 2026 09:22:09 -0400
Received: by mail-dy2-x29.google.com with SMTP id
 5a478bee46e88-328664b752eso570745eec.1
 for <qemu-riscv@nongnu.org>; Wed, 23 Sep 2026 06:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790169726; x=1790774526; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4msTpp+vR3Q9A3d1BOVyjzK5nl0nVEODWOwLdHYYFFk=;
 b=oRShycYaQIBjNVeL1tE336Am0PG1OYDrYg9UQIgxlr4/HwFELCpXppIeAEI3uMyuc5
 244H7SLPslaCLLvIE1KfLWvYeQ5NkdcK2P1Wx6KhkDUwsDPPjcJRGXWDYaIIgqccZJwy
 TzzyqLj0Ia9Mnk2Y2MISK3qYNFTDfOygu65cjNC9SHNACoOoq8u3U1f2m8FSxJznFKqp
 zB6lzRjEFWTpVJy3UU10S01tgBZOcIA7YKm/L5OrwCCUJ1/Jx2DgrE8aywRUvSkhfdw+
 KXz1uFItxCIQCatdwfaKUWR52Cb4nE8vO2xrO8mNZl/vcmSvqDkahnF84ukn93oqTrWc
 QeQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790169726; x=1790774526;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4msTpp+vR3Q9A3d1BOVyjzK5nl0nVEODWOwLdHYYFFk=;
 b=WerQkF3vLXc1gk6Ihv+DEV04/BZxfBQA8eJv4UjNVH61iy1h1/4ql6VcBJzdnNJS+e
 L966it2uC6ZcEjctinyUpHhM9WdDlvePBFV18AO6zYZEnHpMilELKqHFvjjS1LhqOJBb
 u7eohtZNTyOBbfmTey2B5U+Efz+Vy7MS1Yrf2bVc/Lg4aB4CCUdS5RrHItoEBrDgOxeY
 tQMh8JkyZUU57yPxegL2Vb3QYwK06X+XueByFnT8BtmW86V6JN7QtX/ee+MIzaH4tlZb
 Bwz6PSngBPtKzhTmDo5DDM8zvoCGq7fXM5i99dWaO2jcQBGBw71hj3RHnUhcHibR4btf
 E4FQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBx2FpL8rc8alltZwtcXVDlo/tsbVvI6rBJegchPJIAS0sRPFL1jrWY0e8GVRp3jzOl33RYi/vjkzsH+@nongnu.org
X-Gm-Message-State: AFuF++k+xndPHst84+oWjW1QwKa+ryJkwHcY0iI5lv8IrawYYBmxqkKL
 VmvLJOgp5TLMyndvV7n2Xz6iaCKguWv0cZQiI5kGz3kwKeSh4Tsj/qZ9
X-Gm-Gg: AYBFou1wEPCHMu9M4PUM4oCp+DNrQhkNW8YfVfBiREv53kG8dy0aTfTUHkF0lxvF57k
 xIrMjl7F6/fI5+tH88Hgzhols/OPdNuQgha3qlGm2JHK8nPKRffnIPzHianR2Vat/DXYE726n8c
 MIHKB6E+HtSwRHbUTJTumL9wCZhtcS4eEF6gQ755YBD4H8XRb0DhBuTghBZh6QEa2ZyB5yLnUKq
 6eHJwqkd50oy5Qqu5rSpnYAVrorP76oN73qVpa1AahTOitTkS0vekvPRSFPxZ+BOLi+5e/g+EcY
 BppfQr1vz+n8hh8vZSt72S64xR37Cf/w4UxH7IhcLh9pYs2zahqjFKfBlhnC29cjedqRy9TAegI
 bo8+YIxlWSC4euX0wn+PmgcD7Y8523PhVoUpUhde/y8lzs64QWV5fvdFcPCXPb11BgKo+Kp9Ulx
 SutJFx8V2sx1cTp5HyTKfwI3rOagAza7IJMUnOpkHsN8nv+Imzly9ux6i63UsYTsifPPq3tfrzI
 lq4VFwJo2Ooeb6vBFOyRjjtjvICvuI=
X-Received: by 2002:a05:7301:d595:b0:33b:e55f:68c8 with SMTP id
 5a478bee46e88-33e8d8d21e3mr2659104eec.26.1790169725708; 
 Wed, 23 Sep 2026 06:22:05 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:22:04 -0700 (PDT)
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
Subject: [PATCH v3 031/114] tcg: fix off-by-one in helper extend-free assert
Date: Wed, 23 Sep 2026 21:15:05 +0800
Message-ID: <20260923131635.1894-32-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::29;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x29.google.com
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

- Allow n_extend == MAX_CALL_IARGS after filling extend_free.
- The old < check fired on a valid seven-argument extend.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 tcg/tcg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 489df0e7386..6d55cc284df 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2599,7 +2599,7 @@ static void tcg_gen_callN(void *func, TCGHelperInfo *info,
         QTAILQ_INSERT_TAIL(&tcg_ctx->ops, op, link);
     }
 
-    tcg_debug_assert(n_extend < ARRAY_SIZE(extend_free));
+    tcg_debug_assert(n_extend <= ARRAY_SIZE(extend_free));
     for (i = 0; i < n_extend; ++i) {
         tcg_temp_free_i64(extend_free[i]);
     }
-- 
2.52.0.windows.1


