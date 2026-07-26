Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7B8C531CC
	for <qemu-riscv@archiver.kernel.org>; Sun, 26 Jul 2026 05:24:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wnrLm-0004hr-0Z; Sun, 26 Jul 2026 01:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <caojunze424@gmail.com>)
 id 1wnrLd-0004go-I9
 for qemu-riscv@nongnu.org; Sun, 26 Jul 2026 01:24:25 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <caojunze424@gmail.com>)
 id 1wnrLb-0005UQ-RD
 for qemu-riscv@nongnu.org; Sun, 26 Jul 2026 01:24:25 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-8423f52cd57so162649b3a.2
 for <qemu-riscv@nongnu.org>; Sat, 25 Jul 2026 22:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785043460; x=1785648260; darn=nongnu.org;
 h=message-id:date:references:in-reply-to:cc:to:from:subject
 :content-transfer-encoding:content-type:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=55bET/p+Ylrt/eSSngCZaW9KhClj+Tl2RW3KHFQZSjg=;
 b=DVfn52BirDrdwJkeZjgKkFzfzEQdhs/BvAeg6bdAAQfEtaPUhAJm3GZJCXxdPR88/g
 1jsnfpkPWT8kIKP2oc4TincSXL0fKRxbijuTai+9nZVkngGmORRquOVN4d+dsyt2l07J
 RDjtyv1T5idg7a7tekeNejJn7HUDAxpfOyC+XKOUravA32QIFMTnBWIsc4z9JWcSas2o
 ou8Rj6HEz2Nwqo+bnnqn3i4eves7xJ8leisjxNbmfQt0zDDIuLeuz3+V9c8Ffr2IGvGc
 eB3fmPn6xVRRRCNNaMfNV3Z6Xwgr30Zb+YKIV8kmE92ElEygTI0thgE7QzZbT1rtqn1k
 q3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785043460; x=1785648260;
 h=message-id:date:references:in-reply-to:cc:to:from:subject
 :content-transfer-encoding:content-type:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=55bET/p+Ylrt/eSSngCZaW9KhClj+Tl2RW3KHFQZSjg=;
 b=VMIHQiHrwSipau83QNv+pIEXOQxSfwqSIFcEhSdAJK5sUXRuGpGXgh7GwEaI+GRn+3
 ovWNFc7G62T7eHiNlXwytVACfhoHfoyxrI/rV9JaBrjkBadhhpw/udsR5JhN9dkwHMWV
 lA1Qcl8jOxMqxThiVLaa7TcMwtZQ4z58wYZ65fMRogvjXNn2bn1kdg1k5EJz3KyxYjSw
 v1tHjr9+4ECFKh+pt0YwXOZqwPZkta1MV7QLpq4s9SRKp8I//SCV9Q4+Ncgj4vQZWVub
 oCwYX6tzOaWzy+dUB7mP4uhrWQQCEfKKf4j8KArGWp9jbg8zK4UGIBKxQjc96gbLiJKq
 Zzsg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqjY+SUqyoSGv1Ckwf0CTpfUpAmkMW7UWxSwNMo1b1GDpKc5Lkw3H2Pi/rrJfLrw2A7NBvQpMCi95Pb@nongnu.org
X-Gm-Message-State: AOJu0YyqZ9JHstlIyO+omkXJYE8ZJsEckIgcO/MobDnzgdzaPxtEtPQy
 KX5pm2GGKFJdZRKYcmzGhw29aP3jQgvQ0SVFpMtt8+6qkDlCes9hV0W6
X-Gm-Gg: AR+sD12CMYCOzmI+IFlTQ6oYsOqKzi03DL9Fkic4zuSlLKE4osCI2ItOx5yz7CgXL+n
 qTEQ9qQ9oP44v5QwqdwxaUjbkKxNZfFdtBWxN00McwGz/Y3vXk4dKC+6NMOa3HssX4uVIwJ0Ule
 FaFBkuC9IxsXeQ81D4uIYwKjiVcMr6S2elWwPJvm6XUbrXHmQJgFsAFryHqSLcXCSbhieBSlQTQ
 yZTW+lafAX0Ly5RAxkCD3hlnumiZ9ywe/t9m46B/rb8cWVGiKX76XqXLmGD7ffUaKgTfdoQqyP9
 GTpVXdwbhqyhM8oPGjDhQKb5ZXsmiMLiN4OIOc+TS+iQpFFoeAMWf47V+MogD1sereVcsRC7XKK
 /tCRaDxdZ/59VrNWsK+DNH9ZrcWWoFszOpesizaAQA/O7A5IGG8Vtj98DhSaUUaka8GhNz6u6MV
 QzQmviav/5ZsfkVAOFDuhZ
X-Received: by 2002:a17:90b:57e3:b0:381:bcfb:e710 with SMTP id
 98e67ed59e1d1-38f2960521bmr2906386a91.3.1785043459920; 
 Sat, 25 Jul 2026 22:24:19 -0700 (PDT)
Received: from DESKTOP-7HME356.localdomain ([38.34.7.236])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13d6ba579c3sm13228240c88.8.2026.07.25.22.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jul 2026 22:24:19 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/7] hw/dma: add K230 gsdma
From: Junze Cao <caojunze424@gmail.com>
To: Tao Ding <dingtao0430@163.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu@processmission.com, farosas@suse.de, lvivier@redhat.com
In-Reply-To: <20260721161335.73872-2-dingtao0430@163.com>
References: <20260721161335.73872-1-dingtao0430@163.com>
 <20260721161335.73872-2-dingtao0430@163.com>
Date: Sun, 26 Jul 2026 13:24:12 +0800
Message-Id: <178504345275.903105.7911994626854937851.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785043457; l=2093;
 i=caojunze424@gmail.com; s=junze-gmail; h=from:subject:message-id;
 bh=Q9/E2moW0bkhIG7YU3yz+aLdBjdIJf4c9wAOSNsc7js=;
 b=xhGOhpgN2f1n0uKkJmcGmC0CnA3kD2lV5m+Awly23inIkwN2zacaSTsMWcRoyIHvT5usy0OQX
 YqCJcbegiAcC81cZwOZDM2Xu0z8i1/tdeUMUOZ1OMELnvc5oQSHWSpv
X-Developer-Key: i=caojunze424@gmail.com; a=ed25519;
 pk=lnFIWNw+6CoDrHFIKUJKdgrRbvgAbQGcEFiVsIigOJ8=
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=caojunze424@gmail.com; helo=mail-pf1-x434.google.com
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

On Wed, 22 Jul 2026 00:13:29 +0800, Tao Ding <dingtao0430@163.com> wrote:
> diff --git a/hw/dma/k230_gsdma.c b/hw/dma/k230_gsdma.c
> new file mode 100644
> index 0000000000..1f76f62fa0
> --- /dev/null
> +++ b/hw/dma/k230_gsdma.c
> @@ -0,0 +1,532 @@
> [ ... skip 75 lines ... ]
> +    /* Stride line size required for 2d mode */
> +    uint32_t line_space = extract32(line_cfg, 16, 16);
> +
> +    bool dat_mode = c->cfg & K230_GSDMA_CH_CFG_DAT_MODE;
> +    bool src_fixed = c->cfg & K230_GSDMA_CH_CFG_SRC_FIXED;
> +    bool dst_fixed = c->cfg & K230_GSDMA_CH_CFG_DST_FIXED;

The handling for chx_dat_endian is completely missing here. Could you please check this register field in the TRM and implement its functionality?

> [ ... skip 39 lines ... ]
> +            remaining -= chunk;
> +        }
> +
> +        if (!dat_mode) {
> +            if (llt_cfg & K230_GSDMA_LLT_2D_MODE) { /*2d mode*/
> +                src += line_size + line_space;

The 2D mode semantics here don't match the TRM. 
According to the TRM, when in 2D mode and SRC_FIXED equals 1, the correct behaviour is that SRC_ADDR should not increment. 
There is currently no check here to determine whether SRC_FIXED is set to 1.

> [ ... skip 62 lines ... ]
> +            return;
> +        }
> +
> +        addr = next;
> +    }
> +

When CHx_CTL.START is written via MMIO, the entire llt is processed synchronously. During this period, the vCPU is unable to stop, resume, or reset command. This could potentially cause QEMU to be blocked here for an indefinite amount of time.

For the implementation, please refer to the reference in i8257.c.

> [ ... skip 315 lines ... ]
> +static void k230_gsdma_class_init(ObjectClass *klass, const void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->realize = k230_gsdma_realize;
> +    device_class_set_legacy_reset(dc, k230_gsdma_reset);

This interface is no longer recommended for use. For further details, please refer to the comments for this interface in qdev.h.

-- 
bbbbbq <2082291273@qq.com>

