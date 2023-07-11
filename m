Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FBDEB64DC
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 16:47:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJGWK-0003hG-QX; Tue, 11 Jul 2023 12:47:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qJGWJ-0003gX-Tx
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 12:47:23 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qJGWI-0006AJ-8o
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 12:47:23 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-31441bc0092so5857790f8f.1
 for <qemu-riscv@nongnu.org>; Tue, 11 Jul 2023 09:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689094041; x=1691686041;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GLjXD74HpHaDRyStUYLk2D1orR0DeYgXklQ18Oe5qPU=;
 b=fDbH+Z/5KC5Q3/Vk2FWnKPXkvV5xDdwfmwgDoPHu/xQKEVltzAWZ9mYFUc23MOHRiA
 7EczF2GvJK58iAZcsGD9SQq0KCwQauo4iPKWh+SUV5mQZr7FBHc2poTWjZDgS0fRfn2p
 IY8qisKKOfuv/+gXv1n/XYwlVqyoKkXYhD1/VGduR6UaWupqNsN909FQ3+cOKBKMCGIV
 8VMdC6bPkXB/1s/n7Zi7OC5Ptc2ibgQACYaS6UFPunpVLPKI9dRYFYzhxqaMx7U24Pe/
 +0taE0vFyCmBIWjkCY5xBEIrtI2OtZmF9kZTjnciBW5QaLlrx8gBCa0WPMXpTeiylzWy
 opAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689094041; x=1691686041;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GLjXD74HpHaDRyStUYLk2D1orR0DeYgXklQ18Oe5qPU=;
 b=TfCfU8iEQTNNtRg6BdCxuLOteO0cw518GEhF3RAtpPLxT2oRrVgdI3hEExrs9Ekrxx
 CMvso8B5vGhKzVvuWc8qbYfDRhPCLqwXgFSu3TZLt6FknPubzrvBdlSzRHqVv4zf5aaG
 tA0jno6aPNSBwbjkGdMtW+Iq4qxkGq+YwPbzlbSB9VUkeD0WqccE6kDG4SvuubcvVBqK
 4TKf8e06pwGjdB07qdfcRzQ741y93fem1/2EjeQJU6QAdQF1gtzEW3r5t+s6ffR6vM43
 Ednui5AjMcV39qncfyHqJRPGL4QgyJ4z08sf2X0HtRy+bdk0w/WzGRrakDexlmit5pUF
 EYBQ==
X-Gm-Message-State: ABy/qLY03wmzYrailnq+Go9jOZmdW8DMDzgjjZlB6ARH7kPsSyec8XNT
 tshbH4fMvTs7Huh8ipvhaC0umg==
X-Google-Smtp-Source: APBJJlHmiaUu1nv1ZKrfrLQore1wcYY+mpKnki57h5PS0dbG7fM7iT1iItROr2TPoCnOdU3up3Cexw==
X-Received: by 2002:a05:6000:36d:b0:314:1f1e:3a85 with SMTP id
 f13-20020a056000036d00b003141f1e3a85mr14243390wrf.61.1689094040803; 
 Tue, 11 Jul 2023 09:47:20 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.194.156])
 by smtp.gmail.com with ESMTPSA id
 u8-20020aa7d888000000b0051e0f21c43fsm1479561edq.31.2023.07.11.09.47.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jul 2023 09:47:20 -0700 (PDT)
Message-ID: <7b35a2ab-548e-8eb5-cd09-5a2e12d93453@linaro.org>
Date: Tue, 11 Jul 2023 18:47:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: riscv kvm breakage
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Cc: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, liweiwei <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <629afcc2-ffed-c081-9564-7faa6defc1f4@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <629afcc2-ffed-c081-9564-7faa6defc1f4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 11/7/23 18:43, Richard Henderson wrote:
> Hiya,
> 
> This breakage crept in while cross-riscv64-system was otherwise broken 
> in configure:
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/4633277557#L4165
> 
> ../target/riscv/kvm.c:209:38: error: ‘KVM_RISCV_ISA_EXT_ZICBOZ’ 
> undeclared here (not in a function); did you mean 
> ‘KVM_RISCV_ISA_EXT_ZICBOM’?
>    209 |     KVM_EXT_CFG("zicboz", ext_icboz, KVM_RISCV_ISA_EXT_ZICBOZ),
>        |                                      ^~~~~~~~~~~~~~~~~~~~~~~~
> ../target/riscv/kvm.c:205:20: note: in definition of macro ‘KVM_EXT_CFG’
>    205 |      .kvm_reg_id = _reg_id}
>        |                    ^~~~~~~
> ../target/riscv/kvm.c:211:33: error: ‘KVM_RISCV_ISA_EXT_ZBB’ undeclared 
> here (not in a function); did you mean ‘KVM_RISCV_ISA_EXT_MAX’?
>    211 |     KVM_EXT_CFG("zbb", ext_zbb, KVM_RISCV_ISA_EXT_ZBB),
>        |                                 ^~~~~~~~~~~~~~~~~~~~~
> ../target/riscv/kvm.c:205:20: note: in definition of macro ‘KVM_EXT_CFG’
>    205 |      .kvm_reg_id = _reg_id}
>        |                    ^~~~~~~
> ../target/riscv/kvm.c:212:37: error: ‘KVM_RISCV_ISA_EXT_SSAIA’ 
> undeclared here (not in a function); did you mean ‘KVM_RISCV_ISA_EXT_SSTC’?
>    212 |     KVM_EXT_CFG("ssaia", ext_ssaia, KVM_RISCV_ISA_EXT_SSAIA),
>        |                                     ^~~~~~~~~~~~~~~~~~~~~~~
> ../target/riscv/kvm.c:205:20: note: in definition of macro ‘KVM_EXT_CFG’
>    205 |      .kvm_reg_id = _reg_id}
>        |                    ^~~~~~~
> In file included from /usr/riscv64-linux-gnu/include/rpc/netdb.h:42,
>                   from /usr/riscv64-linux-gnu/include/netdb.h:32,
>                   from 
> /builds/qemu-project/qemu/include/sysemu/os-posix.h:34,
>                   from /builds/qemu-project/qemu/include/qemu/osdep.h:151,
>                   from ../target/riscv/kvm.c:19:
> ../target/riscv/kvm.c:288:44: error: ‘struct kvm_riscv_config’ has no 
> member named ‘zicboz_block_size’; did you mean ‘zicbom_block_size’?
>    288 |     .kvm_reg_id = KVM_REG_RISCV_CONFIG_REG(zicboz_block_size)
>        |                                            ^~~~~~~~~~~~~~~~~
> 
> Can someone have a look asap?  Thanks,

See:
https://lore.kernel.org/qemu-devel/20230711163346.69409-1-philmd@linaro.org/

:)

