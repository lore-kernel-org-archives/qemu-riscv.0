Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nwmQB-00028f-Ny
	for mharc-qemu-riscv@gnu.org; Thu, 02 Jun 2022 11:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwmQ9-000258-Io
 for qemu-riscv@nongnu.org; Thu, 02 Jun 2022 11:07:33 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:45926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwmQ7-00008j-Uf
 for qemu-riscv@nongnu.org; Thu, 02 Jun 2022 11:07:33 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 w2-20020a17090ac98200b001e0519fe5a8so5069812pjt.4
 for <qemu-riscv@nongnu.org>; Thu, 02 Jun 2022 08:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AD/rV5KAqeNSG0PM7axYrvg1GrRQCVEPdnq7DcTsxMo=;
 b=KsQ3lWqMy7CZqxJcF+s6qGuuehpBb9rBeaDAzzz4EKm5xrA4InOPXnC3NysI5/pKru
 Wqr3YPryLhbCx4qEGfFXayj7G6sd3Y5M3zYF0xJf0OcqL4bplIGL8pxhHIqIm/nyekwL
 6lARjoFuaSdW1gQGXlt2yfX0W7O5586sK34k5GKhi1FrKUPlDTPlizAHYxv/UDIXzBad
 XtoYbuyvLrDCBnTtZHzrVEtH2JO2IdudkJ2J3tYGQNggJ53AdDYd7Wdjtj5ELHRcDFsK
 yuolDYp/YWL+AqV3UEsvoupkB2oniAogkS8QG5tCtrV2mqP8BzM3nEQiywEPUDH8FO00
 P/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AD/rV5KAqeNSG0PM7axYrvg1GrRQCVEPdnq7DcTsxMo=;
 b=wPac9iv1LDKOv/2RALuRi3x5uzLQkO6KpVh0n2nxpj2sXF2oilBQ10p1F8bQlniSbX
 sEjgxclfaZ0COhideN3AmtLsJRlJMYm3BNyDZ9ncfenh09Sa9gbFHEigQ3JMmtmhwVrV
 3lnlC/atJqhx8zTmWaU52wQABg/lV6Y9csZJPPzIgBNlyvUsH3TPUbIelzWesl3tVJAm
 L1wi20+y1G6V3pknPVIg36beE3nZ/KJ9UP2rKjFrmNz1MoRH5MH/DV0hgbKaaI+Xuj84
 KGLt90fYWHCu/PEKpmqdPuVcshIoHW+pRah1lbQ7pQi1orHMHgAllVr/k3aPDSTM9TB0
 DTPA==
X-Gm-Message-State: AOAM531xit8pv4+R1Uh3hcmYkz96Ql9dhvnMJLSd1r2JwUMORbDikrId
 NEcR9/JoS2GOq2uPG8FT88dNQQ==
X-Google-Smtp-Source: ABdhPJxzjDr1YmEfsKWs/fLGhZrbw3CcuMPe8KztQFxbL1YE252Mq1HCSkyt3rsRO999y056byDf6A==
X-Received: by 2002:a17:902:a502:b0:15e:c251:b769 with SMTP id
 s2-20020a170902a50200b0015ec251b769mr5205138plq.115.1654182450389; 
 Thu, 02 Jun 2022 08:07:30 -0700 (PDT)
Received: from ?IPV6:2607:fb90:80cd:3d17:bb90:8dda:8cb2:7569?
 ([2607:fb90:80cd:3d17:bb90:8dda:8cb2:7569])
 by smtp.gmail.com with ESMTPSA id
 g24-20020a1709029f9800b0015e8d4eb242sm3653593plq.140.2022.06.02.08.07.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 08:07:29 -0700 (PDT)
Message-ID: <1b930ae7-7e7d-b8f5-5202-2242abe994de@linaro.org>
Date: Thu, 2 Jun 2022 08:07:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH v2] RISC-V: Add Zawrs ISA extension support
Content-Language: en-US
To: Christoph Muellner <cmuellner@gcc.gnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko.stuebner@vrull.eu>,
 Aaron Durbin <adurbin@rivosinc.com>
Cc: Christoph Muellner <christoph.muellner@vrull.eu>
References: <20220602134017.155357-1-cmuellner@gcc.gnu.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220602134017.155357-1-cmuellner@gcc.gnu.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Thu, 02 Jun 2022 15:07:33 -0000

On 6/2/22 06:40, Christoph Muellner wrote:
> diff --git a/target/riscv/insn_trans/trans_rvzawrs.c.inc b/target/riscv/insn_trans/trans_rvzawrs.c.inc
> new file mode 100644
> index 0000000000..38b71d0085
> --- /dev/null
> +++ b/target/riscv/insn_trans/trans_rvzawrs.c.inc

Typo in the filename -- s/rvz/rz/.

> +#define REQUIRE_ZAWRS(ctx) do {         \
> +    if (!ctx->cfg_ptr->ext_zawrs) {     \
> +        return false;                   \
> +    }                                   \
> +} while (0)
> +
> +static bool trans_wrs(DisasContext *ctx, arg_sfence_vm *a)
> +{
> +    REQUIRE_ZAWRS(ctx);

No point in the macro for what will only ever be a single user.

Otherwise, the implementation looks correct.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

