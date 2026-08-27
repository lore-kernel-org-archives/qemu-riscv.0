Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058B7C61DC6
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 12:36:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzZKe-0002SR-A4; Thu, 27 Aug 2026 08:35:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonb@tenstorrent.com>)
 id 1wzZKc-0002SI-U7
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 08:35:47 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <antonb@tenstorrent.com>)
 id 1wzZKa-0006Lo-7r
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 08:35:46 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5b15c6fb864so1990559e87.1
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 05:35:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787834141; cv=none;
 d=google.com; s=arc-20260327;
 b=Tch9G3wEJSUoWUIwFXLJTGjfw0eMyDySKiKkQ+nl4cOMakSAbcQynZY/LPJpTbwRPT
 WB2qy/rZ8WYoQmLIHjFYs0xyNQk9/No0m4dD1AWSSYMg1fycvDlbdDCMfTHAeDJOiFrS
 ZueCkmKLRZ4KekoRzwPzcWzUMTEwHvnmAtihZTvu88WUoToilLa0hr5CELzapGea/wTb
 m4krH/GU7yxTP/lm5mYAI5HjKIeZ8XKYwnz8o0RNC/AkWaDLa7OY0aRfiwO8WEL06dym
 UXb2WjSY2qxVWNVXVeHE3dhrQe/TX7p9fxX2tfiZck+E3VQ/c/gHioK600+e6X4SiV8e
 yZpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=bmBiCjz4FpP+Mho9Hs6imIP8cwNxfTOgBgowViwavFM=;
 fh=h/7CYdER8HZ/VMwckRixQXR2GbKNMrDhdnFzg5RbsCI=;
 b=Y3gdqpgvPuhFmUOTRVNW//6irH/6Wq25LLNRhqym4daC/Mu6Z9MWMXpJeeeDicx091
 82rAxKJ+8woKa2HbREo32mzunxDRtYEZESua8mdFCpkQ/mfqw8DWNjyMx66EnwtkvnS3
 m/9Xs7CKJiwSa+ebQnLImUIqDDy6z6jGztwqEvVEV5+2NXkuJYGf2PuZLkcKk9ZRCgv4
 xfnkw1Wqx10qQl8028hsRyWihgPsSApU7IO4tJPvNYpiFTxLfMsm2o6/8KaL9oEjKY/q
 4JFRz+nJbb+w1JrL/GLlRzjX8JC38RPy8G+xZoF8JwtX9i28ltzkJoIsHQasCmgO5SIK
 zKKA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1787834141; x=1788438941; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=bmBiCjz4FpP+Mho9Hs6imIP8cwNxfTOgBgowViwavFM=;
 b=Xd919A4dj3zxevWSTKP9Y++FJkVxGyZvLTbnlmCXrGe4dx39eiKLGAliu/9nV7e4cC
 9+7mDUIp7ctC0K5ocLWTDHT/y/UhVtGBF1gfOgsroVANMWSKSz5W+svaSD2Is/2Fx9l5
 OvP/zNI+etdLcxHHeu4gtofKE4eEl6Up5CyXHO3LXRJtF+eAk4qCTeAYE/bGdlKpJ66j
 dwqqEcLwhM5jDs0/qX4Rb03nqc9o4E1lvbD5mZ3mz7brvQvjz8//+8zOL421qYa0GO2H
 Tj+bJysAuMGCeyLACbhaJMcn9JGQ/Wl/4ENu2gFJjt4IXjv/VyQFKGzlsKKQonynbIud
 /2Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787834141; x=1788438941;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=bmBiCjz4FpP+Mho9Hs6imIP8cwNxfTOgBgowViwavFM=;
 b=jgA6CORKrJoj50L34eEiizw8SjQUXAewm9ol4E0eabKL2jN4jC9vYfiAgRShercAp7
 M8rxRN8ju2t8yMFYtAVMkQTfcgc2vhcoEmC7QLMBhdFEroNEGCLVwn8qDVEhd88h9uXl
 J/gCKBWCOOk3ktxVsJWMHIC4BYpNpmgZ6zddieLLxx/BuxX6X8bDxLYGyUaNlUm1DEKw
 /XUrJUN76veLCDfwP9oz4cLnTQcmIB3Rsn1Zz23LclclzVcT3CILUzVVhNy0Q+Tv3s1v
 5i5Y1ERLKgIqRusCDq1qMlBbtMjWys4qda3jSpBIthz/UyLBZG9pZXbuLO85TZXSKcBb
 Rbtg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpTVhOx26djvURkKrQtdqrRo7e8m0mVASFkd4XW7i+EanQtJwSsRHDwCXGBmDyv8kk/ZW6k0RpK64+T@nongnu.org
X-Gm-Message-State: AFuF++mwmtlhmsc1rl+3FHKEMRHMgO9COyIZ/0pNjflJqPj8sA4Vc12V
 kL1MczmEPTkvsPVW11fthBt7hHpIJP9PbozMK+Old7yaiq74KbY+7WpcS4+N2lohzwSptqQePII
 XvJYWS7gxLt7jsXuD3qSzyiPcYpNz2xADvWaWAR+YSg==
X-Gm-Gg: AR+sD11sUBss7sDJtFfXvy4e/pxaKu8D0ZaVe2QB+2U9WCH51fTaJmq02EU8qo8wAyG
 dNMT6kQNgujinLoJI2yAOZb90BiasV/zt6P3tr9anXa/JbXFIohvavfyM7NLRi8LP9RbC0La1Re
 w/ILsXo49jDt412ICDEN8FlVWnVkqPzpM9uhhckq/YpHZF2/xvVEtZJncAZ/xMyUZdK4KEBEuX+
 aiWobXuwRkUgtnMjURwvjZTonREcqz1avakO1hZqf50ZV6Ac1mxLCAywgBYOoKMotzdC4GyjeYJ
 hoj0G13Yn7zTFe00s+PMpZawRyVifQXtp+7F4JY5mYdbbQ+YTgb/2SCI5lYLde2MxcdL4O8zpw=
 =
X-Received: by 2002:a05:6512:6d:b0:5b3:e02:b3a0 with SMTP id
 2adb3069b0e04-5b4a90439a2mr4240415e87.7.1787834141422; Thu, 27 Aug 2026
 05:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260811104301.1377245-1-liliang2057@phytium.com.cn>
 <df5ee5defd5fd2363df46a61aca2eacb697cc9aa.camel@wdc.com>
In-Reply-To: <df5ee5defd5fd2363df46a61aca2eacb697cc9aa.camel@wdc.com>
From: Anton Blanchard <antonb@tenstorrent.com>
Date: Thu, 27 Aug 2026 22:35:29 +1000
X-Gm-Features: AcwNN1XiItSGYxVfWHWw4WP2l5jxpttKmGavz8HrMk6Unx7ewnIUXox8RcOFlA8
Message-ID: <CAN7m+mAFT2Cm2yvHb9KKRe6GH=Rg-S+8NXYSjkFhXEJS0wtD7g@mail.gmail.com>
Subject: Re: [EXT] Re: [RFC PATCH 0/1] RISC-V vector fault-only-first vl
 truncation under plugin memory callbacks
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "liliang2057@phytium.com.cn" <liliang2057@phytium.com.cn>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "joel@jms.id.au" <joel@jms.id.au>, 
 "palmer@dabbelt.com" <palmer@dabbelt.com>, 
 "daniel.barboza@oss.qualcomm.com" <daniel.barboza@oss.qualcomm.com>, 
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
 "chao.liu@processmission.com" <chao.liu@processmission.com>, 
 "zhiwei_liu@linux.alibaba.com" <zhiwei_liu@linux.alibaba.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, 
 "liwei1518@gmail.com" <liwei1518@gmail.com>, 
 "tangtao1634@phytium.com.cn" <tangtao1634@phytium.com.cn>, 
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=antonb@tenstorrent.com; helo=mail-lf1-x136.google.com
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

Hi Alistair,

> > We hit this in practice while generating SimPoint BBVs for
> > SPECcpu2017 500.perlbench_r under a memory-observing plugin:
> > the instruction stream diverged from the plugin-disabled
> > baseline at perl_parse's vectorized strlen.

> Is this what you were talking about?

We hit this with xalanbmk, but it is the same issue.

Thanks,
Anton

