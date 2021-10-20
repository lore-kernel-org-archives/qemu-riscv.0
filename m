Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdJR9-00080Y-MN
	for mharc-qemu-riscv@gnu.org; Wed, 20 Oct 2021 17:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdJR4-0007zs-5Z
 for qemu-riscv@nongnu.org; Wed, 20 Oct 2021 17:47:46 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:52131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdJR1-00080X-20
 for qemu-riscv@nongnu.org; Wed, 20 Oct 2021 17:47:45 -0400
Received: by mail-pj1-x1036.google.com with SMTP id kk10so3448560pjb.1
 for <qemu-riscv@nongnu.org>; Wed, 20 Oct 2021 14:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fQ41YMjLjjAgkT4whZZHIg0VWXaZjCRxOnXpBqEXV9g=;
 b=s0sek1Ea7hw4kb+HCkQxvD17pr1Lc4JmEIB/9S3dwhMxEQz5MMroXTyfsTEGX4tCWL
 g4YUZXRILLAUdAzEXJHHx1QDpkru/7HpxL7U2XITLK/HoiafyZGTI0P7LEUrxwVkI6M/
 /xHDYpGIFS0h23586iKfFAtb2gAIs5SEa7OaxxmZVzZKYO3wc1hTGia/UFp3UYzpB+6R
 lDmOjCWEPbAhsTzzkl0C6y/P3sUYUbiitJw0JbVS6zipamJ0xnCVnoDQgm8xz6tvnOJk
 06dWrLdl5fmukGxInT87wDemGb2/iMRA1D9U7r7Hgt+NdZbgYOh/udJKXiLOgS913DJX
 txFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fQ41YMjLjjAgkT4whZZHIg0VWXaZjCRxOnXpBqEXV9g=;
 b=MtXHqQ2UBIAe08/RyZIWBy4wyvlytvZ9Il2EhZyirAvwA7Qk8j51om6F/6ZByC0RfV
 21KUw07ZV7r5Gz1d+UCj/OhZ7HFLCys4kIafzS6+keLxGNVSOd57Mzz7x1MV+DfjNii7
 xOd2t7T69BDxBw7qj/+k2AWHSnKrGDS73zP68BJsYECRGiHhtd3vJ9vI3vLPTd1+/S0/
 HXusPt+Y4ULNS8+TntFo69ENojDiK5Y+g0qiKzShJWJ+4dF/IdGIEkAoG+BfGm3kfyFh
 mcqUcENo0bFeLNUbPV9eA7inlmHdusmBNnXD+82dtC9OFokE1R8JldZL1+aVviE1XQiW
 OKQw==
X-Gm-Message-State: AOAM532FJ96VYnV1ILA8HPKviUKVAwOFRhvwubrWQK6ekwqTrmhSH8+i
 nl50qVclHQTHBDZxnURNm2yzig==
X-Google-Smtp-Source: ABdhPJxe93jqP5pHu5OrPxKsx83pHCazKGu/UWDKYxm5HizbHBNmYEGQMzxTSPrZmVqvaLfbxsiHZg==
X-Received: by 2002:a17:902:d202:b0:13a:709b:dfb0 with SMTP id
 t2-20020a170902d20200b0013a709bdfb0mr1514807ply.34.1634766461297; 
 Wed, 20 Oct 2021 14:47:41 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm3962323pfg.148.2021.10.20.14.47.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 14:47:39 -0700 (PDT)
Subject: Re: [PATCH v3 17/21] target/riscv: helper functions to wrap calls to
 128-bit csr insns
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211019094812.614056-18-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3def0c73-e419-b2a5-7a38-b9782f502d2f@linaro.org>
Date: Wed, 20 Oct 2021 14:47:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019094812.614056-18-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.267,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Oct 2021 21:47:49 -0000

On 10/19/21 2:48 AM, Frédéric Pétrot wrote:
> Given the side effects they have, the csr instructions are realized as
> helpers. We extend this existing infrastructure for 128-bit sized csr.
> We have a slight issue with returning 128-bit values: we use the globals
> we added to support div/rem insns to that end.
> Theses helpers all call a unique function that is currently a stub.
> The trans_csrxx functions supporting 128-bit are yet to be implemented.
> 
> Signed-off-by: Frédéric Pétrot<frederic.petrot@univ-grenoble-alpes.fr>
> Co-authored-by: Fabien Portas<fabien.portas@grenoble-inp.org>
> ---
>   target/riscv/cpu.h       |  4 ++++
>   target/riscv/helper.h    |  3 +++
>   target/riscv/csr.c       |  7 +++++++
>   target/riscv/op_helper.c | 44 ++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 58 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

