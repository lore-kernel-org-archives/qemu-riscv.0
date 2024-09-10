Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC4AEE01ED
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Sep 2024 22:22:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1so9Bh-0002c3-8B; Tue, 10 Sep 2024 18:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1so9BS-0000JD-OA
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2024 18:18:02 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1so9BP-00071d-0V
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2024 18:18:02 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-7184a7c8a45so3839543b3a.0
 for <qemu-riscv@nongnu.org>; Tue, 10 Sep 2024 15:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726006676; x=1726611476; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qnKY2nRodBoXlCJxTEKFwGzTN7ry8AAwSqqRpoqXdQI=;
 b=emjaA88w629Fq02MGJdbQ02eYi1AZTO9ZldaWbpEvDOE3HYdYtUE918usjQaBbU8QR
 pVm7ViAVWq7LJbmxa1QP77pO1rq/sWTdpdRd0y8MFcnwWYWz2kY00G9xj9CAhZ+8ifj0
 tX1UbijV2vTPBHir0KnBWdqWxPsj52uXzf+puRAxFLY5uVs5KbxU5MxY65ErFeFbmvk/
 0u2YWKGiuzq3+n2riZw+3z6I2qt/tId8cprqxgemtBAAgZrxZ+CLVW8QRJMN3Dl84Rj3
 ZmMB8GTU/zn7Yp/S6jSfMqY3fAoRi8RlHO38ec9Y371jpKhzIHHmc3UK5v5Nccef2Ckr
 Snag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726006676; x=1726611476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qnKY2nRodBoXlCJxTEKFwGzTN7ry8AAwSqqRpoqXdQI=;
 b=uLHS9enpi+MkXHBcUB7kXxFLgcTRS1sHHZH0WcQo3KV0u2zdgaE0vLvWdGnzEOBX6I
 5wCQX48br/SkTLuWc4QYB+eTlgK+mbxglD8gM9MDTUYIDk5UwgNWH3cREWEUmzfP2f8U
 +yo52aZ6xmJWhy6DhNrwiC+w2tnd9FE5Ob2xQxULomw7JK5EbMbKnwJlWAWxN2UDhBNz
 C0tzBUH5+WD87BLixwPL/U/Zxbcj4wpWtq9uQtdwy5ELFrXmizwxU+1ZByv9esFuo3d7
 84MiwMkknEUazKbfLZ+ZPZr0rQI+hAE8tZ0y4qaHDF2hraBtfT/VkPncK6S1+25MusYV
 fJYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJjElyS9oJndnPmxKOBdZXSoJLs06UYpKMfn1dgZc8jF1fdysKdpokaZuaN7zYPEEW4YpBhKqCETmg@nongnu.org
X-Gm-Message-State: AOJu0YwVtXOvl+tZ2wvb/HdcJnpV7pW4dnSMM7H+wxcslMgjptxk3jjS
 0sX07X+TEeglwFqQnqqq8hVsC0KY6KET95/hVT8NfZRhTPCacCIJn15nP01JJbM=
X-Google-Smtp-Source: AGHT+IG4cFG5WUgQCn+PBNKJBzHgRuN4SjwOR6zpKqMGbFV0/QZbeUwbVdFfJerNt+rSe5+kt4gssw==
X-Received: by 2002:a05:6a00:b8f:b0:70c:f1fa:d7bf with SMTP id
 d2e1a72fcca58-718d5ded8e1mr25670829b3a.4.1726006676561; 
 Tue, 10 Sep 2024 15:17:56 -0700 (PDT)
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 15:17:56 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>, "Richard W.M. Jones" <rjones@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Corey Minyard <minyard@acm.org>, Eric Farman <farman@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Keith Busch <kbusch@kernel.org>,
 WANG Xuerui <git@xen0n.name>, Hyman Huang <yong.huang@smartx.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Ani Sinha <anisinha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jesper Devantier <foss@defmacro.it>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>, qemu-s390x@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>,
 Rob Herring <robh@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Helge Deller <deller@gmx.de>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Xu <peterx@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Klaus Jensen <its@irrelevant.dk>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Jason Wang <jasowang@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 32/39] hw/tpm: remove break after g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:59 -0700
Message-Id: <20240910221606.1817478-33-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42a.google.com
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

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/tpm/tpm_spapr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/tpm/tpm_spapr.c b/hw/tpm/tpm_spapr.c
index e084e987e6e..5f7a0dfc617 100644
--- a/hw/tpm/tpm_spapr.c
+++ b/hw/tpm/tpm_spapr.c
@@ -206,7 +206,6 @@ static int tpm_spapr_do_crq(struct SpaprVioDevice *dev, uint8_t *crq_data)
                 break;
             default:
                 g_assert_not_reached();
-                break;
             }
             trace_tpm_spapr_do_crq_get_version(be32_to_cpu(local_crq.data));
             spapr_tpm_send_crq(dev, &local_crq);
-- 
2.39.2


