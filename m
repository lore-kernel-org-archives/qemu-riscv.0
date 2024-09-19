Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20195CE8D4C
	for <qemu-riscv@archiver.kernel.org>; Thu, 19 Sep 2024 04:52:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sr955-00038B-UJ; Thu, 19 Sep 2024 00:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1sr94x-0002T8-N6
 for qemu-riscv@nongnu.org; Thu, 19 Sep 2024 00:47:44 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1sr94r-0007SL-4I
 for qemu-riscv@nongnu.org; Thu, 19 Sep 2024 00:47:43 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-7db299608e7so261636a12.1
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2024 21:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726721256; x=1727326056; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eNWqkzSNCBE+28dt8xOll3Id+6eEjKMEGJfuDzGU1co=;
 b=zMPuRZqiQFk+Pu5xxrbzFNezEAif+k8yooqEH6VmXaHilyrV0Sgn2zPK/VleKxK9z0
 FSXhV3LbDhjkW3BddsayLbbLCl8su5w6wdiUSEUvvuoErlUO3+Bf5g5Ao329e9I55ndc
 smWXu5u8aO/SiRYL3qb63yLu7oUKa9XzZrRBxakRK5TBSUDz5tbDcXEc68UdfZc7qwTe
 /A0/mBGIeDfAs/lPGkC0cjR+qpUhCf6kRjy7Nyl3y9Cjg1/dGrZyx98Ees7Tj0u922HV
 T38ID/lyHy3En+AhJkIbEVbiaw2h0wQYn+oesj+4a6f28ma1g4jU5xM+7zOJjxJyQ6PI
 9ZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726721256; x=1727326056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eNWqkzSNCBE+28dt8xOll3Id+6eEjKMEGJfuDzGU1co=;
 b=ghzCXyS85VFw6EF60C096cVVTGwkUqtnxAu7cAyaS5pKKbhxvoMmqftMsJ6xhSFJE8
 y/YvQtxpqXM9a92r3cXaNVtOZASBngdVZTtGIt2QpuyBHqX0RTRCR/Qp4JkwbVZ/917S
 cibzUZ8YlkLP6qqlIzzWOFYDU0ZIBervRNG4ubPQtnq7Dr1VaI1vY1+3e0a/YybL5Vsy
 zs415Nmxda2JBvD7LrfXCJnQkF3z/y9hO1Z09fsFajfYh069qep0PkPWN4NaWtq7e/9V
 Ntv/wg/SSUls84YPQvXPJPaihHkvjA7oGGSB9+vVywaSVMjOO/dCu4Sg4vtwhB208m+Z
 bjPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiOsETJ5n//ILcEm1G2mMXFTG24Em8fqOP28pArzgpf//jxtZKJ9caOmA6leTuy3ZNNxMj/Zm67DFo@nongnu.org
X-Gm-Message-State: AOJu0YzDLY9kna4nZ6Ag6TIC7ksSZ4aJxdZtaDJv343+0l3V2Vy2BFFC
 uvKl9K1KNN1lr5HkhlXAyyjZ15JjQxF53qgWZz2CLQaqNfw8Lrt04xbfT5URkwI=
X-Google-Smtp-Source: AGHT+IG0RTXo4zmQGQBlENczTzliTQANG1tf/+V1ayQphhYWAEQO8ZekAqNGAnEsgrQycROh/RQPBw==
X-Received: by 2002:a05:6a21:1690:b0:1cf:4348:d5c8 with SMTP id
 adf61e73a8af0-1d112e8bfaemr31803053637.39.1726721255788; 
 Wed, 18 Sep 2024 21:47:35 -0700 (PDT)
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2024 21:47:35 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Hyman Huang <yong.huang@smartx.com>, Halil Pasic <pasic@linux.ibm.com>,
 kvm@vger.kernel.org, Bin Meng <bmeng.cn@gmail.com>,
 Peter Xu <peterx@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-s390x@nongnu.org,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Corey Minyard <minyard@acm.org>, Laurent Vivier <laurent@vivier.eu>,
 WANG Xuerui <git@xen0n.name>, Thomas Huth <thuth@redhat.com>,
 Rob Herring <robh@kernel.org>, Eduardo Habkost <eduardo@habkost.net>,
 Nicholas Piggin <npiggin@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Ani Sinha <anisinha@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Fam Zheng <fam@euphon.net>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Keith Busch <kbusch@kernel.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-riscv@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Jason Wang <jasowang@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Fabiano Rosas <farosas@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Weiwei Li <liwei1518@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, Helge Deller <deller@gmx.de>,
 Yanan Wang <wangyanan55@huawei.com>, Michael Rolnik <mrolnik@gmail.com>,
 Jesper Devantier <foss@defmacro.it>, Marcelo Tosatti <mtosatti@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 25/34] include/qemu: remove return after
 g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:32 -0700
Message-Id: <20240919044641.386068-26-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x529.google.com
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

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/qemu/pmem.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/qemu/pmem.h b/include/qemu/pmem.h
index d2d7ad085cc..e12a67ba2c0 100644
--- a/include/qemu/pmem.h
+++ b/include/qemu/pmem.h
@@ -22,7 +22,6 @@ pmem_memcpy_persist(void *pmemdest, const void *src, size_t len)
     /* If 'pmem' option is 'on', we should always have libpmem support,
        or qemu will report a error and exit, never come here. */
     g_assert_not_reached();
-    return NULL;
 }
 
 static inline void
-- 
2.39.5


