Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851A7EE01EB
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Sep 2024 22:21:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1so9BE-0006vF-0L; Tue, 10 Sep 2024 18:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1so9Ad-0002DM-0I
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2024 18:17:13 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1so9Aa-0006qx-K4
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2024 18:17:10 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-717911ef035so4712309b3a.3
 for <qemu-riscv@nongnu.org>; Tue, 10 Sep 2024 15:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726006627; x=1726611427; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PMAzhundz5cnlhXkr4isErmBbfbpq/QVHnsSNQckDH4=;
 b=pkuW1WWOHMhT+xq4/3jXk6kMTPRboMNn4gR+5Fn8t0pKhIozjgvqHalvzjJbqC/UDt
 V62xEmXOZZEi432RQMZKBuvAmWKfvLpHyH4VIBZWMIN0AsyTR/58JzNhOWXNjGv7ZgAk
 ZEwRzlWNoUpLyi0S+UxrMNPYL6u3VKQ+3rCpxmv4kLt/XCnKwNRjri3yY9kxq+ByGf5Z
 swBCbrTOwkIQ46w4J5eozZArCRkDIeTRWmdV2EqHpLPuTqkCyMt1IRSc/7lyY6d0pBEV
 kVlQTy4ByJsfPsnSlsDfpkUjbzSgW8h1BmsykSlNvh7oGm/gcHr0WEx4ozp2DZodNmg1
 XKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726006627; x=1726611427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PMAzhundz5cnlhXkr4isErmBbfbpq/QVHnsSNQckDH4=;
 b=gNSB5uf6L866JVqE97ELEOEH43HfHkSS6/NQs92h8nibz9QBm7f3fD6KayqgUmZ3UR
 ZBpgmiZLlhnl3IN2IbuYAytmwbJ6BC4Og+u5ZYWWB8mjsMvHUuaNXC0a5A6COsTaQ8Lk
 fIlj3I+YBYEceC60TMRajEkUkCM1EzAmy1wWv/C7Vmyd+lH5W3Eo9z+KNa6ajuIb/Lg5
 TfwYn/lTdcCK9/H7jTFzNvP9SWrGyg8nKX0DReqHv4sjXdHZpNqTxAd1fuCW9vS0DiJK
 dTWznT49nzNK/kecAP4Gj+Y9MECZOLYHXMZtWoQIWR1INaYeNzfhv/Mtbkkdg47CpLoe
 vwwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlmsbEdXaQsEzN8QtlQhe/3prj9PyQR7F1OH1XVNEsoTSuuXtJvWwamKayS8iy0KTR9wYU6SR3hm/m@nongnu.org
X-Gm-Message-State: AOJu0YyzvvXyPlIsIk6SPGxmUniONveJ8eKwzZ0ax1Qe3KYXfeLSrClk
 SpnO8+BPkpIAVl2McQJEUyKXmZVLFhpQG2Nzz4LTSTvjQzeAF6/aFAEwxVs89PA=
X-Google-Smtp-Source: AGHT+IEi5JaA4MkES+9U+PpXOPIvBZ+R7wRmXVH+oG4VWiCcruy8sEZ0nEXAobw17ZrGyKMKj2WwFA==
X-Received: by 2002:a05:6a21:3a48:b0:1cf:20a7:ec65 with SMTP id
 adf61e73a8af0-1cf5e19cebbmr2662324637.49.1726006627163; 
 Tue, 10 Sep 2024 15:17:07 -0700 (PDT)
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 15:17:06 -0700 (PDT)
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
Subject: [PATCH 24/39] accel/tcg: remove break after g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:51 -0700
Message-Id: <20240910221606.1817478-25-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x434.google.com
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

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 accel/tcg/plugin-gen.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index ec89a085b43..2ee4c22befd 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -251,7 +251,6 @@ static void inject_mem_cb(struct qemu_plugin_dyn_cb *cb,
         break;
     default:
         g_assert_not_reached();
-        break;
     }
 }
 
-- 
2.39.2


