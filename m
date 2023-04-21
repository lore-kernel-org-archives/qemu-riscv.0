Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppzOk-0000zQ-Ov
	for mharc-qemu-riscv@gnu.org; Fri, 21 Apr 2023 18:38:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzOg-0000yU-JK
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 18:38:31 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzOd-00006y-UY
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 18:38:29 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3003b97fa12so1410299f8f.2
 for <qemu-riscv@nongnu.org>; Fri, 21 Apr 2023 15:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682116705; x=1684708705;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fDWUzdwWSTcrIpv4Eyp45VwaJpiY4jXRlSByEyJLVcU=;
 b=BDjQk0zxIT/8f4/OyS4ZJAUe+dQMzRwFKzJMCC7xi7VsSNl8RluDfwAAg78VVvulXQ
 LDJjaloEZ2CiTFYpfkaCJKYGjML/eNg0jHG54LihNLUQa4QAuZF2tOmUKErLjieMYeqR
 qPx9vLE5MPHEH0GvIQNX0tYSwqJ8zHl7uQ7BaL8kd3NCFcbnDYZyY7RyamfLEa95fBIL
 K9hDP3iQtY/kVtIkbpkb7JUuQu0O/tlU3qMOwHd6zUqYb5LHqfekJFsMAVvZrZNDxNs1
 lvP1jD2sYn/RRAxfu2LTkle5qOsPtESkWJfdu4doGf0tgcJbXRw110UbyQdtWHyvuIFC
 pqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682116705; x=1684708705;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fDWUzdwWSTcrIpv4Eyp45VwaJpiY4jXRlSByEyJLVcU=;
 b=Le+z1Q9juj4z3PpgNJJdhnfWwpD6AOmZvllpYYJb2RFtXshGpxTAn0gKhNkDM5X0I/
 D6nkiDLCpBjPCllnJkT1nQwyumKlyoQFmqHpKXgJcebomiSgyoLbE0Tv0MztBFX8vlpc
 tYmUjy91HzzlP4yaDx74vQjpp+3zCdB+BVZQqy3dISMssqlisWowOROtclFuxw7gRb72
 Q6kgbDNyC7WoxpVaGMXOZ84jFDDtL2JA/pzW4qyUzlqz3Gw5Wp2ReOVpt2pQKW0cBe8Z
 DjDuNCm6aCOKBUSagK7SlQbV4JgAYPLO7ehGeZSZ1yaij4Pa9FeU3sOkHP0ZgTkMsVO2
 ZcXA==
X-Gm-Message-State: AAQBX9fyFRbThRWpgOfjZ+WFrMTuiLMIDid/LxLaHQDXvKexWgMNcwEm
 m/LfFgPPF5HYowR8mqp8RsXpYA==
X-Google-Smtp-Source: AKy350YP9s/26SdGjQ0AWdoKYCSG8uePHVzsrHfBQ8yALR+ocqM4PvSrXDBhUx+fKnchpdk/+cEAig==
X-Received: by 2002:a5d:6149:0:b0:2fb:9dbb:3407 with SMTP id
 y9-20020a5d6149000000b002fb9dbb3407mr4562202wrt.51.1682116705544; 
 Fri, 21 Apr 2023 15:38:25 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 s8-20020a05600c45c800b003f18992079dsm6363921wmo.42.2023.04.21.15.38.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 15:38:25 -0700 (PDT)
Message-ID: <e5cb9092-23c5-8449-9520-4494ccbc5e3c@linaro.org>
Date: Sat, 22 Apr 2023 00:38:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 07/54] tcg: Split out tcg_out_ext32s
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
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
X-List-Received-Date: Fri, 21 Apr 2023 22:38:32 -0000

On 11/4/23 03:04, Richard Henderson wrote:
> We will need a backend interface for performing 32-bit sign-extend.
> Use it in tcg_reg_alloc_op in the meantime.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c                        |  4 ++++
>   tcg/aarch64/tcg-target.c.inc     |  9 +++++++--
>   tcg/arm/tcg-target.c.inc         |  5 +++++
>   tcg/i386/tcg-target.c.inc        |  5 +++--
>   tcg/loongarch64/tcg-target.c.inc |  2 +-
>   tcg/mips/tcg-target.c.inc        | 12 +++++++++---
>   tcg/ppc/tcg-target.c.inc         |  5 +++--
>   tcg/riscv/tcg-target.c.inc       |  2 +-
>   tcg/s390x/tcg-target.c.inc       | 10 +++++-----
>   tcg/sparc64/tcg-target.c.inc     | 11 ++++++++---
>   tcg/tci/tcg-target.c.inc         |  9 ++++++++-
>   11 files changed, 54 insertions(+), 20 deletions(-)



> diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
> index f55829e9ce..d7964734c3 100644
> --- a/tcg/aarch64/tcg-target.c.inc
> +++ b/tcg/aarch64/tcg-target.c.inc
> @@ -1429,6 +1429,11 @@ static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rn)
>       tcg_out_sxt(s, type, MO_16, rd, rn);
>   }
>   
> +static void tcg_out_ext32s(TCGContext *s, TCGReg rd, TCGReg rn)
> +{
> +    tcg_out_sxt(s, TCG_TYPE_I64, MO_32, rd, rn);
> +}
> +
>   static inline void tcg_out_uxt(TCGContext *s, MemOp s_bits,
>                                  TCGReg rd, TCGReg rn)
>   {
> @@ -2232,7 +2237,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>       case INDEX_op_bswap32_i64:
>           tcg_out_rev(s, TCG_TYPE_I32, MO_32, a0, a1);
>           if (a2 & TCG_BSWAP_OS) {
> -            tcg_out_sxt(s, TCG_TYPE_I64, MO_32, a0, a0);
> +            tcg_out_ext32s(s, a0, a0);
>           }
>           break;
>       case INDEX_op_bswap32_i32:
> @@ -2251,7 +2256,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>           break;
>   
>       case INDEX_op_ext_i32_i64:
> -    case INDEX_op_ext32s_i64:
>           tcg_out_sxt(s, TCG_TYPE_I64, MO_32, a0, a1);

While here, maybe reuse the new helper (easier to read):

             tcg_out_ext32s(s, a0, a1);

>           break;
>       case INDEX_op_extu_i32_i64:
> @@ -2322,6 +2326,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>       case INDEX_op_ext16s_i32:
>       case INDEX_op_ext16u_i64:
>       case INDEX_op_ext16u_i32:
> +    case INDEX_op_ext32s_i64:
>       default:
>           g_assert_not_reached();
>       }

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


