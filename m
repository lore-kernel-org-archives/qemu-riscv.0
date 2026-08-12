Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E04BC5CFDB
	for <qemu-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 11:04:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wu6jp-0001Xj-2j; Wed, 12 Aug 2026 07:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <caojunze424@gmail.com>)
 id 1wu6jm-0001TS-SW
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 07:03:10 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <caojunze424@gmail.com>)
 id 1wu6jg-0007nn-2s
 for qemu-riscv@nongnu.org; Wed, 12 Aug 2026 07:03:09 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-7ec6d9a81b0so176539a34.3
 for <qemu-riscv@nongnu.org>; Wed, 12 Aug 2026 04:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786532547; x=1787137347; darn=nongnu.org;
 h=message-id:date:references:in-reply-to:cc:to:from:subject
 :content-transfer-encoding:content-type:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=iZm5te437nQml2v9RXOM8AOaBBTvZAax5pwnwjgjZMs=;
 b=jCmYZfQBQpfQcfcUdvZLcsnjRy30FnXgMuWelgFLbyDtCB+85jurU3rxgypa2e5YSE
 4K30k3zBI8AjtUWWC7ZwYlOf5hLMMwThSy8DSIjn5b4CNAw8+/4bEK43YYv76bOc6eta
 qAET9e/8xvhrGoNlAefs39xgbihKbq30sOQ6BKZxIt6P9mqcsLHfjFd0AxxA50+Cxh64
 8vPU5vO6l+ESfqPChjXZtwSvd1ewH9vF6jcsvCfaJJqwxqtZrvgMi0q1JBhxW/ekAhvr
 erTO1cEzIt7q+CJ05kpAsyTTThnBx/78yQSE4kT4mLWTaXNo9xjaLlUzBZ81xlW+timZ
 3B7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786532547; x=1787137347;
 h=message-id:date:references:in-reply-to:cc:to:from:subject
 :content-transfer-encoding:content-type:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=iZm5te437nQml2v9RXOM8AOaBBTvZAax5pwnwjgjZMs=;
 b=iRElNwjQL4X1M3UIzPtg8Qnw5axJalqHK5L8PkflNO2dpMC31eutnjILh0z6FwpcwM
 er0EPUbDg/FIVIByXDUT3pNinAXo8SPrb30EwFHnD+Ot08HLWFkJFss0iUJXtXsOl4kv
 1rCUy3dEkOVHlEAoIQzZYAeYX1MPMuya/qz7Izt8UYrQojXi7grp596saNW7MzPPXyna
 JlVZ4AyvZKOSOvViwIRnRS7hRWRfvoJAa/S+dU9NWsV/IFtR3s8jzDnS/7Akyz0zD1VP
 cQ/izAeri43MkXWQrGwecUxB4nynipMpnGgYjzYiVkS7w2HfZV/7inCX5y8yPj0pGRAV
 bU9w==
X-Forwarded-Encrypted: i=1;
 AHgh+RrlmmyiWKcFFCtsNgyqmVzMmTZvqfwPf+F6OCBNczEl1Ss6BOcHx4a82BSG4eOCcDW2tu6DvQeppXOp@nongnu.org
X-Gm-Message-State: AOJu0Ywo66eRCWwzD+kASk2p5Md2ZCIfZCbalAo9Hj7H/ZD71qBZRGvC
 sTIHdbuHrbPt5W5rAGH6d9gDIeouIfnUxafiI6gOYZpvz8EtrEpDfKYq
X-Gm-Gg: AR+sD107alfHyOQu9iy3GD81dJ7gNbEy8jd7qdOa7YY41ruLZvMhQiAwfKOjJj9sUWj
 X1vhGWkgVENlGwDomq9Qn7rWRdHK/eUMOVvYzKqBB6R5G9B0hIEgW/LCoXoYv/k66XW9qhbQj3c
 LL17NWWEuqyc8/pSpb13EL3Y+Ob9vnh6ago5gtIsG8vpx1FnE+8tZXYlUjiWG6rECPIZ0tgSthq
 JM7qJEvC/7oKNbfMP+ZQBNG2OjRKRaebgs1iJpxQwBGNBhJICw6NPKtISnHjevOEs5ybSQ0EQRU
 MoYHfSegz9jXabxjCVLf/qr667ZtjO4M2KjjVut+wDVmOLVETdVEMjnoAgoqcr8Sk9XkNipujwH
 47RC1RGO2dsZ3pdiZvUcjPhR4ZqQ6iWb5Lh0/Om6vxX4KwTrLpMVKKAwGRmO8lvOE2M+orHHpxY
 Y/65GSnd80pg4kP3KQpcbJsPk2XOuXHxNRZQustKJTH7qkB8+8EjHtrZPgWg==
X-Received: by 2002:a05:6808:1824:b0:4a4:866:c1c5 with SMTP id
 5614622812f47-4b210deb9b3mr2193511b6e.2.1786532547312; 
 Wed, 12 Aug 2026 04:02:27 -0700 (PDT)
Received: from [127.0.0.1] ([38.34.7.236]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-31cf3c08163sm9105729eec.7.2026.08.12.04.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 04:02:26 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/3] hw/misc/k230_iomux: add Kendryte K230 IOMUX model
From: Junze Cao <caojunze424@gmail.com>
To: Kangjie Huang <flamboyant.h.01@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Chao Liu <chao.liu@processmission.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <42d005d6e530e2cf2c7df8634e8b82c0f77d1702.1784022244.git.flamboyant.h.01@gmail.com>
References: <cover.1784022244.git.flamboyant.h.01@gmail.com>
 <42d005d6e530e2cf2c7df8634e8b82c0f77d1702.1784022244.git.flamboyant.h.01@gmail.com>
Date: Wed, 12 Aug 2026 19:02:13 +0800
Message-Id: <178653253398.92831.18366427252686733896.b4-review@b4>
X-Mailer: b4 0.15.2
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=caojunze424@gmail.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Tue, 14 Jul 2026 18:22:00 +0800, Kangjie Huang <flamboyant.h.01@gmail.com> wrote:
> diff --git a/hw/misc/k230_iomux.c b/hw/misc/k230_iomux.c
> new file mode 100644
> index 0000000000..cc40dc8ae4
> --- /dev/null
> +++ b/hw/misc/k230_iomux.c
> @@ -0,0 +1,124 @@
> [ ... skip 102 lines ... ]
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->desc = "Kendryte K230 IOMUX";
> +    dc->vmsd = &vmstate_k230_iomux;
> +    device_class_set_legacy_reset(dc, k230_iomux_reset);

Thank you for your contribution.

This device_class_set_legacy_reset interface is deprecated, and RESETTABLE_CLASS is recommended instead. 

Other than that, I don't see any issues. I'd suggest rebasing it onto the latest master in the next version and including the base commit.

LGTM!

-- 
Junze Cao <caojunze424@gmail.com>

