Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdDFf-0001fY-3G
	for mharc-qemu-riscv@gnu.org; Wed, 20 Oct 2021 11:11:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdDFb-0001d7-Vu
 for qemu-riscv@nongnu.org; Wed, 20 Oct 2021 11:11:32 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:36720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdDFY-0002Ig-L3
 for qemu-riscv@nongnu.org; Wed, 20 Oct 2021 11:11:31 -0400
Received: by mail-pl1-x636.google.com with SMTP id f21so16366798plb.3
 for <qemu-riscv@nongnu.org>; Wed, 20 Oct 2021 08:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pbOmR/uu9Y6U9PShnUphTe5F9bZJmgePHMeigmGuR9I=;
 b=JVYkBeTJF6H/fuo0LdiHpbuvtq5Mv8Jpi+1IqDMQPMX7/UKD23KZM/s2B8Ix5KpXU9
 GXneBLQMv8TVMCGsbA7CTJdUugU0WoAFS3OQUnDZndcvM1mOBRqzeqUgunY8KfcCIf3Z
 QymyZ4iKMoWNkge0zFG/rkUgrdoVsenn2orLtIulY/WOQ5lxMAqamD7VhEDYITfmPhrk
 c2horpMzcCQf0aAGK1AP+ETUyytFaGiLttmpmvzyGb0qOyvs4VilA8ansbxvy0U89z/V
 5vDR5K5G7GSr9cereG1McfOPb4GDqU/+Txn60XggmpNq2vytPFFOqry6vBGFHwl9JbNh
 YsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pbOmR/uu9Y6U9PShnUphTe5F9bZJmgePHMeigmGuR9I=;
 b=DC5+hwj2IXoyIqpFQo4cs/thZIzT5CGHUEjTsm9Pof/Jj07dT+HBYDRt4bfGTYzf5J
 jG4knTIuwZgFQGl2h5BLaPAA0EYSOqJL3/dSd/CwX/plAZxgCKzJMv+wXmlE18YS0jPI
 9yu95HPMPV/CJXoNU67xtk7ixiGqYfdhLE7ljg0ipizd7UgMLdUJuX8Ec8b1w6eH0l5e
 nvIoG4bL65mI/ICXgFadOElQdgpN/es9Qd11CA4IJ+9BtGYgAAy+J+/+gB92CzYWMt50
 7ZF8hBCSR47nENUIpjR6427ywArFlLVzLiDPMZ9TwRQtChRhEQCaNhgA8cWzD6F5NL0v
 jltQ==
X-Gm-Message-State: AOAM5306nmoP1tp3zQck2BXrYNQSW/WvkFUXkSXWTpcjpMCkRrnx2aj6
 bYRSx5xRl3RHzd4OY+avmj7SmQ==
X-Google-Smtp-Source: ABdhPJw+tmT5o3O4S5RRiwEP/4DdKpW3EXbUvQBJpL3CCnRb79eD5G1DTrwNg6T50UEBQ7Q1i2yOHw==
X-Received: by 2002:a17:90b:4b4f:: with SMTP id
 mi15mr8062521pjb.97.1634742687000; 
 Wed, 20 Oct 2021 08:11:27 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z11sm6305182pjl.45.2021.10.20.08.11.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 08:11:26 -0700 (PDT)
Subject: Re: [PATCH v3 09/21] target/riscv: moving some insns close to similar
 insns
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211019094812.614056-10-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bc095a77-aef6-9915-ba51-7cdd7aaf9351@linaro.org>
Date: Wed, 20 Oct 2021 08:11:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019094812.614056-10-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.267,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 20 Oct 2021 15:11:32 -0000

On 10/19/21 2:48 AM, Frédéric Pétrot wrote:
> lwu and ld are functionally close to the other loads, but were after the
> stores in the source file.
> Similarly, xor was away from or and and by two arithmetic functions, while
> the immediate versions were nicely put together.
> This patch moves the aforementioned loads after lhu, and xor above or,
> where they more logically belong.
> 
> Signed-off-by: Frédéric Pétrot<frederic.petrot@univ-grenoble-alpes.fr>
> Co-authored-by: Fabien Portas<fabien.portas@grenoble-inp.org>
> ---
>   target/riscv/insn_trans/trans_rvi.c.inc | 34 ++++++++++++-------------
>   1 file changed, 17 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

