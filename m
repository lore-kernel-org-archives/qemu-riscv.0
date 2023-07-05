Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E51A5EB64DA
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 13:33:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qH2cR-0006NQ-IH; Wed, 05 Jul 2023 09:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qH2c2-0006Jn-Ot
 for qemu-riscv@nongnu.org; Wed, 05 Jul 2023 09:32:07 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qH2c0-0001zL-Qb
 for qemu-riscv@nongnu.org; Wed, 05 Jul 2023 09:32:06 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-51da8a744c4so7573095a12.0
 for <qemu-riscv@nongnu.org>; Wed, 05 Jul 2023 06:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688563923; x=1691155923;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BC1jdW44jTbjaqw2f+cHkqvuGEwANPMIK+BI/ks2IFM=;
 b=XDbDSozq35ZG0pXCbsCpOfO7iANG2I1G6CfJEwXUGwroSkox9wFFNPyOFGZlyR0ZN1
 gwSR6q5IJz+JTmQ2+HbnA+FsJfFx//Cx7MDyGP6xqQj5pS8ePITVfiOwS4HaDpfwKMz2
 qrjCJtX5x+LUmHqvD54lu8bxs6nUpC92QkmxBjeGksl1doJjDZznu3Vzzeblx66OHvKH
 5xcZVJGN5LKzY4XzxMaV8KQpZU4unp00GP8BjzBvnfUcBFb+hViKs/Q8iXZ2UCqhgA2/
 Ofv+d+6bfYkIhIr9u0Al34GR1epXqVgc+DLTVzoODWhDq0+huYQP16zih5ysaio9/66H
 pfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688563923; x=1691155923;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BC1jdW44jTbjaqw2f+cHkqvuGEwANPMIK+BI/ks2IFM=;
 b=N1kKYs79mSiNknzGpXQ5HS6WY9uInd33EMhP79wJJHja10K+X23SV73c7YCc4sXPgp
 gtuYduhoxO/dJHrrmA1WOwuxKjg1UypOvpPARuFDLIqFYY0HTjQgv0ev28XVIGKxh1c+
 PKihkAlG4PyyRpyHoU4XhfuuTFY2zTkuYrBvBSXAJzmue51zaFH0QRhgkLKkWGnfDDsf
 Mr+jIg8Y7EJ0MWRo95cCHqPLnkfxdVKxu2Iur8gCjDHfd3mMeZs+KVovVr5ahRl8Joj5
 TMlS3hDqtYVe89Rau6R4au1rIGv/iWwiH7hutav9x+ec++OnTzxBfGnoBUpNkWMx68SQ
 YEfw==
X-Gm-Message-State: ABy/qLbx9ILbeQHIfYNVgiQkMstI4VPPHdh8kYUUcufhl1O3e/4zvtc+
 McZj4jq86Shpl4leU4COh4lb2g==
X-Google-Smtp-Source: APBJJlE1s3AeW0n7XHE+gP/KuquZEt+wiurKiZM0MJJV2zqY+4ase25SCW25I0URuVRnEriRlVsLZQ==
X-Received: by 2002:aa7:c158:0:b0:51d:9ddf:f0f6 with SMTP id
 r24-20020aa7c158000000b0051d9ddff0f6mr11671088edp.36.1688563923308; 
 Wed, 05 Jul 2023 06:32:03 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.142.96])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a056402148b00b0051e1a4454b2sm2701296edv.67.2023.07.05.06.32.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Jul 2023 06:32:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Laurent Vivier <lvivier@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Amit Shah <amit@kernel.org>,
 qemu-riscv@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/4] io/channel: Explicit QIOChannel doc is based on GLib's
 IOChannel
Date: Wed,  5 Jul 2023 15:31:36 +0200
Message-Id: <20230705133139.54419-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230705133139.54419-1-philmd@linaro.org>
References: <20230705133139.54419-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x532.google.com
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

One can get lost looking for "public API docs". Explicit
we are referring to GLib IOChannel documentation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/io/channel.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/io/channel.h b/include/io/channel.h
index 229bf36910..998718b470 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -97,7 +97,7 @@ struct QIOChannel {
  * The first five callbacks are mandatory to support, others
  * provide additional optional features.
  *
- * Consult the corresponding public API docs for a description
+ * Consult the corresponding GLib IOChannel public API docs for a description
  * of the semantics of each callback. io_shutdown in particular
  * must be thread-safe, terminate quickly and must not block.
  */
-- 
2.38.1


