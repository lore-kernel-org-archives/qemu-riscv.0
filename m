Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pj212-0007ik-1A
	for mharc-qemu-riscv@gnu.org; Sun, 02 Apr 2023 14:01:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pj20p-0007gj-Pk
 for qemu-riscv@nongnu.org; Sun, 02 Apr 2023 14:01:07 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pj20n-0005S9-DX
 for qemu-riscv@nongnu.org; Sun, 02 Apr 2023 14:01:07 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 o6-20020a17090a9f8600b0023f32869993so30333907pjp.1
 for <qemu-riscv@nongnu.org>; Sun, 02 Apr 2023 11:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680458459;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=50/MORJXGiGELOfi51bGwFeHg6JkFIafyR4uAqyikms=;
 b=RGvbzGg9nyTFOw0WLEx1lCdgWevfrTUbv5ocM8HrDLRsDSdOUr3BpKvRzhPZUnlR9c
 +Qrf/u07KezfG1vkb+dL0C87UDhBDNbNiIasqkIlC8j6HL7IsvjrpIZclRDda7CuDAfB
 LfzFiAKnLl2dH7MFf3f0VM9VJINlr0DK4deIcKvfeiLDGXoyP0ExE2tw7MOB7DaV2apC
 AvcZujKDUp8tzLBBkL+qhzfCGiqY9nXrCsVUD94usFuegMJKy6zmUDvU/I3vJDjhmdql
 p45Fn4ZQOA3A24OHRUkIn8v2RAVtL/JasJXuoJQuvLH+oPyEMhdC3zvU0Sv4Gezny0de
 apdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680458459;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=50/MORJXGiGELOfi51bGwFeHg6JkFIafyR4uAqyikms=;
 b=0oANRup5SGFSsbypqtdizmvZgFAAwrcUrg1UQWmTcFQXazRngbtnWDNaA28unL7Ddo
 fKXI8YSad1sBEyEvCQ1NrO93sNNzs0JgMRr3wVsjlPK0oTVvMv0c+rAhqpUk0kZQMt3E
 sv95y1iR60ojnLJTH1oopLbKRC5S3lgolhAbclHqbd+Pp0lcgyvtWsGyFjOQSjbkIf6H
 fmuKtKW7kZf6tfWQyTTF9qQC2KpshxzW+FYTI81M1fbBowy03t2QCyBwM23x5T0OuyGV
 X5s3HMw+3YfJxd87DepO0A5IyuuZaABOz9WPmLw6MRu9qfzyVXNrTMWNcNlS7oCiVBK/
 bqOw==
X-Gm-Message-State: AAQBX9e+al+qiEJvYFIJP5PrU2ezB0gSdb0PJzcEVQKOSPW3KxSXYNVg
 h525MF0OnByusiblvYQQVn5PbQ==
X-Google-Smtp-Source: AKy350YIK+Y3PyeTHC4dIKSgB1NLreRtwA6QferEbM89DvHN0lqajLPWATfYz6w/XSO2riVDbD6EpA==
X-Received: by 2002:a17:90b:3b45:b0:23f:86c2:54e2 with SMTP id
 ot5-20020a17090b3b4500b0023f86c254e2mr36826534pjb.16.1680458459362; 
 Sun, 02 Apr 2023 11:00:59 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8c4d:19ea:12ae:de91?
 ([2602:ae:1541:f901:8c4d:19ea:12ae:de91])
 by smtp.gmail.com with ESMTPSA id
 kd14-20020a17090b348e00b00233ebab3770sm4767340pjb.23.2023.04.02.11.00.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Apr 2023 11:00:58 -0700 (PDT)
Message-ID: <83dc4a04-1b26-dd72-63cb-940f8929b58f@linaro.org>
Date: Sun, 2 Apr 2023 11:00:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RESEND PATCH v5 4/6] target/riscv: Add support for PC-relative
 translation
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, liweiwei
 <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230401124935.20997-1-liweiwei@iscas.ac.cn>
 <20230401124935.20997-5-liweiwei@iscas.ac.cn>
 <15b60df7-40ca-330c-faa9-daaa78b2000d@linux.alibaba.com>
 <7e87df52-cc1d-4a85-a83b-f12b80b7f040@iscas.ac.cn>
 <e0dc20a2-1a93-6c3d-b3e1-f62c7d1d61c9@linux.alibaba.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <e0dc20a2-1a93-6c3d-b3e1-f62c7d1d61c9@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.37,
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
X-List-Received-Date: Sun, 02 Apr 2023 18:01:08 -0000

On 4/2/23 06:17, LIU Zhiwei wrote:
>>> Why set pc_save here?  IMHO, pc_save is a constant.
>>
>> pc_save is a value which is strictly related to the value of env->pc.
>> real_pc = (old)env->pc + target_pc(from tb) - ctx->pc_save
> 
> In this formula, the meaning of target_pc(from tb) doesn't match with gen_get_target_pc in 
> the code. Its meaning in the code matches the real_pc in the formula. I think we should 
> rename the gen_get_target_pc to gen_get_real_pc.

Neither name is ideal, because it is also used for things that are not "pc".
See e.g. target/arm/, where this is called gen_pc_plus_diff.

This makes slightly more sense for uses like auipc and jalr.


r~

