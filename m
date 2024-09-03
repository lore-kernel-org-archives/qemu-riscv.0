Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61EFECD342A
	for <qemu-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 15:16:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1slVGK-0007zP-Ja; Tue, 03 Sep 2024 11:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1slVGA-0007y0-Mb
 for qemu-riscv@nongnu.org; Tue, 03 Sep 2024 11:15:58 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1slVG7-0002Dv-Qn
 for qemu-riscv@nongnu.org; Tue, 03 Sep 2024 11:15:58 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-71431524f33so4430127b3a.1
 for <qemu-riscv@nongnu.org>; Tue, 03 Sep 2024 08:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725376551; x=1725981351; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dCSwEr56B/IZH5hqdte0NmJ82E6p5nvadjeSBP7X3+I=;
 b=voCvQUJD8B8QMgs0lxJNcSwZN9LA9JdKFpWptFmApsmAHktQnVyrHj03zvgDwgjm7B
 fY/Tf+jyZkr1m0uk3me1AACQ7vn0gBHCIYuJGvMsvDZtJ0HIUf+NPnMvoAPnlJCfssgi
 2AEpHm/G1Wn6qX7m9CRBqiNuPk1ZRm9dLPKex1lf0jwuTnCdd90BydoG8/zbQsOzQFHK
 l+pCOkIoPjN8PeZ8BtoK+r0v+yvq8PTFdHvYZRk9865P5gElXGHE5+JOshCL33Ohvxjd
 2dLAT9Xp6ih+iliJ6qi1RO98/13f0V9O3/YBfha0gZampDzRlPbkdOUamyPoxs6QGLvV
 4AmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725376551; x=1725981351;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dCSwEr56B/IZH5hqdte0NmJ82E6p5nvadjeSBP7X3+I=;
 b=JjRAPU7QCcZIo1MfGO39A3NAL7EbyzwOSLJv0NrvYfQX29VOT4FrWY3hgQrTau/O87
 n/RsorPMRYcu7QN5ji55kNnsWhk74FxU3SQMEyLtc3/+AGCzsWcY4HO4ioKCElEKof0e
 e54v0kIskQVBDqCqulvQvC9hr26PpOkW4gLFJyghCAG8PmDflyHHdwWTiwnizNXrib9E
 vfrYJKH+3qI2HTWTFnsTuXZ6m43nP9df1aXcpdaTw4Wb1h7Meqi5dlC0sYjYPWTAaMfN
 gCxhs/+0DML4NuhH+oOUY8Hs1CYK5qnV5Q11tvbIHyTW02gs66aBRm6/D2OC34UpfD4n
 JTLQ==
X-Gm-Message-State: AOJu0YyNW8hGE/sz8GiFUf4i9V6kJQwC95EPE3jprO8cniy/XihjH7cV
 fIqInBr5hxCQcyOi2ZemTIr2mbfuEIy2Z8ygqVmGlDdrcOaAbsXk6lZOgU9Xjg0=
X-Google-Smtp-Source: AGHT+IFcCGvrhp1Sq9SrRlwCRmR6LHwLBRu0GxkWxMJoAylxoZtK1mlxawXU6MDFajoLE+7Z/8+L7g==
X-Received: by 2002:a05:6a21:6b0c:b0:1cc:d4a0:2675 with SMTP id
 adf61e73a8af0-1cecf49aeedmr12877607637.3.1725376551288; 
 Tue, 03 Sep 2024 08:15:51 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-715edc66743sm7633024b3a.152.2024.09.03.08.15.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 08:15:50 -0700 (PDT)
Message-ID: <97873524-9e47-44c4-b34a-a27e9833b0e1@linaro.org>
Date: Tue, 3 Sep 2024 08:15:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/14] tcg/riscv: Implement vector roti/v/x shi ops
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 dbarboza@ventanamicro.com, liwei1518@gmail.com, bmeng.cn@gmail.com,
 TANG Tiancheng <tangtiancheng.ttc@alibaba-inc.com>
References: <20240830061607.1940-1-zhiwei_liu@linux.alibaba.com>
 <20240830061607.1940-14-zhiwei_liu@linux.alibaba.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240830061607.1940-14-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 8/29/24 23:16, LIU Zhiwei wrote:
> @@ -2589,6 +2605,69 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
>               }
>           }
>           break;
> +    case INDEX_op_shli_vec:
> +        if (a2 > 31) {
> +            tcg_gen_shls_vec(vece, v0, v1, tcg_constant_i32(a2));
> +        } else {
> +            vec_gen_3(INDEX_op_rvv_shli_vec, type, vece, tcgv_vec_arg(v0),
> +                      tcgv_vec_arg(v1), a2);
> +        }
> +        break;
> +    case INDEX_op_shri_vec:
> +        if (a2 > 31) {
> +            tcg_gen_shrs_vec(vece, v0, v1, tcg_constant_i32(a2));
> +        } else {
> +            vec_gen_3(INDEX_op_rvv_shri_vec, type, vece, tcgv_vec_arg(v0),
> +                      tcgv_vec_arg(v1), a2);
> +        }
> +        break;
> +    case INDEX_op_sari_vec:
> +        if (a2 > 31) {
> +            tcg_gen_sars_vec(vece, v0, v1, tcg_constant_i32(a2));
> +        } else {
> +            vec_gen_3(INDEX_op_rvv_sari_vec, type, vece, tcgv_vec_arg(v0),
> +                      tcgv_vec_arg(v1), a2);
> +        }
> +        break;
> +    case INDEX_op_rotli_vec:
> +        t1 = tcg_temp_new_vec(type);
> +        tcg_gen_shli_vec(vece, t1, v1, a2);
> +        tcg_gen_shri_vec(vece, v0, v1, (8 << vece) - a2);
> +        tcg_gen_or_vec(vece, v0, v0, t1);
> +        tcg_temp_free_vec(t1);
> +        break;
> +    case INDEX_op_rotls_vec:
> +        t1 = tcg_temp_new_vec(type);
> +        t2 = tcg_temp_new_i32();
> +        tcg_gen_neg_i32(t2, temp_tcgv_i32(arg_temp(a2)));
> +        tcg_gen_shrs_vec(vece, v0, v1, t2);
> +        tcg_gen_shls_vec(vece, t1, v1, temp_tcgv_i32(arg_temp(a2)));
> +        tcg_gen_or_vec(vece, v0, v0, t1);
> +        tcg_temp_free_vec(t1);
> +        tcg_temp_free_i32(t2);
> +        break;

I'm trying to work out how much benefit there is here of expanding these early, as opposed 
to simply using TCG_REG_TMP0 when the immediate doesn't fit, or for rotls_vec negation.

> +    case INDEX_op_rotlv_vec:
> +        v2 = temp_tcgv_vec(arg_temp(a2));
> +        t1 = tcg_temp_new_vec(type);
> +        tcg_gen_neg_vec(vece, t1, v2);
> +        vec_gen_3(INDEX_op_shrv_vec, type, vece, tcgv_vec_arg(t1),
> +                  tcgv_vec_arg(v1), tcgv_vec_arg(t1));
> +        vec_gen_3(INDEX_op_shlv_vec, type, vece, tcgv_vec_arg(v0),
> +                  tcgv_vec_arg(v1), tcgv_vec_arg(v2));
> +        tcg_gen_or_vec(vece, v0, v0, t1);
> +        tcg_temp_free_vec(t1);
> +        break;
> +    case INDEX_op_rotrv_vec:
> +        v2 = temp_tcgv_vec(arg_temp(a2));
> +        t1 = tcg_temp_new_vec(type);
> +        tcg_gen_neg_vec(vece, t1, v2);
> +        vec_gen_3(INDEX_op_shlv_vec, type, vece, tcgv_vec_arg(t1),
> +                  tcgv_vec_arg(v1), tcgv_vec_arg(t1));
> +        vec_gen_3(INDEX_op_shrv_vec, type, vece, tcgv_vec_arg(v0),
> +                  tcgv_vec_arg(v1), tcgv_vec_arg(v2));
> +        tcg_gen_or_vec(vece, v0, v0, t1);
> +        tcg_temp_free_vec(t1);
> +        break;

And here we can use TCG_REG_V0 as the temporary, both for negation and shift intermediate.

     vrsub_vi  V0, a2, 0
     vshlv_vv  V0, a1, V0
     vshrv_vv  a0, a1, a2
     vor_vv    a0, a0, V0


r~

