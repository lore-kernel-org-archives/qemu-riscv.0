Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6A6C79FA0
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 17:14:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3cto-0001xw-Og; Mon, 07 Sep 2026 13:12:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cQq-0007E2-MF
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 12:42:56 -0400
Received: from mail-wm1-f51.google.com ([209.85.128.51])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1x3cQp-0002mz-2d
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 12:42:56 -0400
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-49b8ce9b733so30213575e9.1
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 09:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788799373; x=1789404173;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=pWk7MV0WjBOJc/s9RX0ZBDFXEdiiCKZ4mANozxUHjQs=;
 b=Ukqq9L/YOefRZ1quQcWfyA4mwbUafgqu263b0OX/btxe0X7brQkEaD+tM/MLnUWIX/
 d51Wsi/yzA7dMvZlMmuTd/eDbx91UMLIuVV6MY7dW3v2oPm95oAADIGqN9Y+E5lTxHYe
 q3zkwdPa60TBnBfSivQQnwgu/rYXVJ4x1alftEQH+MFIaB3U0vhq8JRBnj856B9KGgi3
 NJX76jIbq+oXRP1gU7YiXT5bUI8WxpEZb/y8BvTAo+FCFQNrFKLgkEQjFJoZgSy070kX
 ZloMsOV9rKPNFX7A/hiPQQT00P8W3V6X9tHHZ2mbGBrHUFdXw1ELxz+4V9k4HWZhdnlp
 rmGg==
X-Forwarded-Encrypted: i=1;
 AKwUvBz5y5S4D0PfTflqcK555KSXOD7TYrzudBVW8OboNSjw64VxZsBUN1qoprid9xyV0EPnCpiMzSiYsq7Z@nongnu.org
X-Gm-Message-State: AFuF++nuBAEprR0C/4Lo2UMh03iTy2qWKSHznVD+e+rP56euBqllLf7r
 VEEBLceBLDs+TQb3YKPSWQt2lipJ7TleDg2OJEaumcCO7/3gzpRMNe+U
X-Gm-Gg: AYBFou2EKWkgOlHkcjFFOD5+lkse1TppiseLt11AQ60IymDWvQW0XjW7vyTHpBjdVl+
 Y+s+31eE4okEapkGUOSQucVh+OkFQ+1j4kERhzpdh28DYc+Xw8r+Cuobqy97SA21R5Op3JI5CC8
 OQvYi/avhGej9spInK1gGz469EwLoHW+U+C7/nutHT+V85+dlbwqUloKaEjWHEQhMBEdSi3N1YP
 6nvpm/gLgHdiavL3P8ejOXjH/+AJ1TS6sq26SCCr5Zd/QoZVz9NvNXr6dwA0PQCD/xF9iu2Tbzg
 aJvR3eU+z4S7RTugNvrQpzeMuzmQF0NyZpyEyxLV1v3sfNE7gc5fJ/bhGmlq/G52iwYM167yHtc
 iZ2K68WLCbNvwgDsfLbSe/sWRDtdau9i7DwT1Mlvh8Yx3/t2rE6lsPAv7QblYswVlqBFTjrAUTI
 89cF1y601CFCO/wYctfomnDE/hohgFM3ubUJDxE43UQIi5vl9F2FqEfS0iiaEwz2dJ5QKxVsNpz
 Uc0P1/AYBJXQcrXBLmAQmgMowxVJXENc34=
X-Received: by 2002:a05:600c:4e49:b0:49c:fa20:cc05 with SMTP id
 5b1f17b1804b1-49cfa20ccd2mr220297615e9.28.1788799373426; 
 Mon, 07 Sep 2026 09:42:53 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce5927b68sm408228125e9.1.2026.09.07.09.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 09:42:53 -0700 (PDT)
Date: Mon, 07 Sep 2026 18:41:52 +0200
Subject: [PATCH 02/50] docs/system/arm/aspeed: add the sanmiguel-bmc
 machine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-bmc-minerva-v1-2-0d83ad610c3b@free.fr>
References: <20260907-bmc-minerva-v1-0-0d83ad610c3b@free.fr>
In-Reply-To: <20260907-bmc-minerva-v1-0-0d83ad610c3b@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Patrick Leis <venture@google.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788799319; l=827;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=OuuDyLAyQiERaSazvNIfVs0crUzUw8PgfLhgJ7loAvM=;
 b=4YbwkbfJ2rItupdRU7HedBVqsWVfaM8izdAwpE+mCra/75bjWknMooS+YmE3J9KMGUJk009cz
 FywRamSunRYAlL52c0gu+MNFZxhDlTwBpa+DwIH5lxMDsHStk8d0Hst
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.51; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f51.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 07 Sep 2026 13:12:51 -0400
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
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-riscv@nongnu.org>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

The Facebook SanMiguel BMC machine is supported by hw/arm but has never
been listed in the Aspeed documentation. Add it to the AST2600 machine
table.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 docs/system/arm/aspeed.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 933df41f96..f38f33cbe1 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -34,6 +34,7 @@ AST2600 SoC based machines :
 - ``bletchley-bmc``        Facebook Bletchley BMC
 - ``fby35-bmc``            Facebook fby35 BMC
 - ``catalina-bmc``         Facebook Catalina BMC
+- ``sanmiguel-bmc``        Facebook SanMiguel BMC
 - ``anacapa-bmc``          Facebook Anacapa BMC
 - ``gb200nvl-bmc``         Nvidia GB200nvl BMC
 

-- 
2.50.1


