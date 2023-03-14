Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pc8Zg-00089V-UP
	for mharc-qemu-riscv@gnu.org; Tue, 14 Mar 2023 13:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pc8Zf-00088B-FU
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 13:36:35 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pc8Zd-0002QE-9a
 for qemu-riscv@nongnu.org; Tue, 14 Mar 2023 13:36:35 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 l16-20020a9d4c10000000b006944b17058cso8828849otf.2
 for <qemu-riscv@nongnu.org>; Tue, 14 Mar 2023 10:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678815392;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5+ta97khfy5Txpd/mWLtAJn2uzdgdCo92ZeHWgpDl/Y=;
 b=u/EapF52Pw8skgpMYMBCFLDk0wMGz4w029qUN2Zd00eOLtMCXvT2v2sT7BFAzsKn1S
 Bb49T6l2416BVX6VBkvKkhdBToqFT2ero+xIvZvpNtZF3N5PB/GPAtgjg+5JbbPJ0lsS
 5ibPaqWAqOk7GIL2hBp89n9w6GYSoqHlom3hZb/2wQoO1Am1qszq5sLaNrqTz9U6sdKB
 IadG90QilgshgjAFPZkMqP+NdiX19WMwOe3PYKlLa9L1y5fSKW3XNMsdhvdMF8gS3sPn
 pDYYvhuBW0sH0sa1F6ymfsc9rjkfcWFmNXF23kzjBaA0Ejn17IYJm6rtfau9ej6VgXJX
 qX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678815392;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5+ta97khfy5Txpd/mWLtAJn2uzdgdCo92ZeHWgpDl/Y=;
 b=aQ0DDWrFuYdm81n1pWnG3oHqZgPPeW8sGekHSmlt/Evecab+yJWYNG83RqMiExk9Qv
 4/py2ZsRlj4T2x3pn0rsIhl/G2Cb5KJTCjkzWvdHDpbMA1qfSj3ipwnx4MFWaDB+pZ5T
 mi9PQDbQcxpCefuQlVtBV6NVAzBAJm1FO5rOsaW5V6M57RxjMF5+7lCzxNuhb5E8NLcX
 a7m5kgSPcpSDutJ8t9Z7nMRbJSfFsYUxxIkN0KVqzThIldRJxI49w5WBK2tatz8hospj
 tc/m5DvpYM9aADR//6IcpCkZ42lPBpTYuajhKbg+pFvrOx5V1FLD6jqmNV+r965Hdc85
 xONw==
X-Gm-Message-State: AO0yUKXAkDPRlOzGNp57ezhdSq6CEKMPvjjv7SREMOFGH8iWLiyJhXfD
 FeUtzf6RD8tY7aNZt4anLASXsQ==
X-Google-Smtp-Source: AK7set9BrxqR36RnvOV1+uPZ1AhqKG5aFuxvEY5r/DqxDwnJmLut9TY/a71EgovOrUUpChBLUUeumw==
X-Received: by 2002:a05:6830:2b24:b0:68d:4140:4333 with SMTP id
 l36-20020a0568302b2400b0068d41404333mr22004076otv.1.1678815391955; 
 Tue, 14 Mar 2023 10:36:31 -0700 (PDT)
Received: from [172.20.4.181] ([50.232.40.61])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a056820034e00b00525398a1144sm1279182ooe.32.2023.03.14.10.36.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Mar 2023 10:36:31 -0700 (PDT)
Message-ID: <d359c89c-a2da-a76f-1d82-093a318ffa7c@linaro.org>
Date: Tue, 14 Mar 2023 10:36:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.1 v2 04/26] target/riscv: add PRIV_VERSION_LATEST
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
 <20230314164948.539135-5-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230314164948.539135-5-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Tue, 14 Mar 2023 17:36:35 -0000

On 3/14/23 09:49, Daniel Henrique Barboza wrote:
> All these generic CPUs are using the latest priv available, at this
> moment PRIV_VERSION_1_12_0:
> 
> - riscv_any_cpu_init()
> - rv32_base_cpu_init()
> - rv64_base_cpu_init()
> - rv128_base_cpu_init()
> 
> Create a new PRIV_VERSION_LATEST enum and use it in those cases. I'll
> make it easier to update everything at once when a new priv version is
> available.
> 
> Signed-off-by: Daniel Henrique Barboza<dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 8 ++++----
>   target/riscv/cpu.h | 2 ++
>   2 files changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

