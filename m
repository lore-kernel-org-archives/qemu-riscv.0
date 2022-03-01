Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nP7AU-0005AN-Se
	for mharc-qemu-riscv@gnu.org; Tue, 01 Mar 2022 13:24:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nP7AU-00057I-3w
 for qemu-riscv@nongnu.org; Tue, 01 Mar 2022 13:24:14 -0500
Received: from [2607:f8b0:4864:20::102d] (port=35436
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nP7AQ-0004ns-1W
 for qemu-riscv@nongnu.org; Tue, 01 Mar 2022 13:24:11 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 v5-20020a17090ac90500b001bc40b548f9so2657219pjt.0
 for <qemu-riscv@nongnu.org>; Tue, 01 Mar 2022 10:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DSheRycdDeRG7OKdDtLwk2sF/5q29jDrs7ZK5nn8ngg=;
 b=A48FGflbDJEr8OSeg7gx9c2h2a9bUkfsDhTTlxls8Swa2gxesahblPTsSJLgTiCMbU
 QR+PO4vQqZWR678S4IQxUCWvP7qzUrUhu7/01D4c9hjBgsQHbyThMMDFSK1NOZIUZA8p
 cbdyQdLnC+oQny8bJFxRJbSEM3d+m6z9SSbpzZc698YKNK1SX/oavM4dVvIGDzfFxvSp
 6+HGE460Ch7KfFFB5iS5CgA3n+NZ3WtwBJW6/iwJ6Awrzyav72uprn0rY5TjNTe9RJEn
 r9tjGFNzkYNL5HxojF4PMMJ5CxwGkg1ZVz+YvR2E+dnV+BEn0LUiHnPJHM4hb/o2UPeh
 qq/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DSheRycdDeRG7OKdDtLwk2sF/5q29jDrs7ZK5nn8ngg=;
 b=O4Bk1fEyX+046Xh/z+t9X95MVuCqmYeKFbJo7RSH+Kl1fDU5QCei1DWILK42LWQ21i
 UPKc15Ix9Lul1VSM5L9mz0fnxG56yOWc0lz+uNiGvi9v5gzum5OYfCe8y5GuatDuQrOv
 xd07GfaPE2C1ZGfh0VxP+eueOma3w9OxMH24gH3t0ESjQAbb5DvmJO/+sVmWT6Bw1cNf
 7lkPCQIz+LsijcV3SnDbCFBtMZnX7+Wzbkb8je/y+7e0AecJjFgbbNz1LQmEg7oZwJMj
 2RX34fGa8u3HCc3v7BWsWUNGt7kzZ50VUjtl+HBc8JhJv7wDLmTALl+OfFyI26PfdRs9
 g9zw==
X-Gm-Message-State: AOAM5311tLI9cMvKPUFm9I9gSADTJPBxttfqkOf9eF3qzT3xf7Q85Ywq
 jxNOmkT5S6cVqWkWJBLabCczAWiGs7A/eA==
X-Google-Smtp-Source: ABdhPJzxnJbHSKop8cwoPzBggGTB3phrpzBfcAvgu/0pclzRcM4oHdA+002sOZdXq30WBo6Li7yRxA==
X-Received: by 2002:a17:90a:ab08:b0:1b9:c59:82c3 with SMTP id
 m8-20020a17090aab0800b001b90c5982c3mr22891161pjq.95.1646159047833; 
 Tue, 01 Mar 2022 10:24:07 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 s33-20020a056a0017a100b004bf85a94ef2sm18900019pfg.183.2022.03.01.10.24.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 10:24:07 -0800 (PST)
Message-ID: <4b3307ab-0d90-6bdd-e5eb-84df496da01a@linaro.org>
Date: Tue, 1 Mar 2022 08:24:03 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v8 09/14] target/riscv: rvk: add support for sha512
 related instructions for RV32 in zknh extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
References: <20220301115828.355-1-liweiwei@iscas.ac.cn>
 <20220301115828.355-10-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220301115828.355-10-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 01 Mar 2022 18:24:14 -0000

On 3/1/22 01:58, Weiwei Li wrote:
>   - add sha512sum0r, sha512sig0l, sha512sum1r, sha512sig1l, sha512sig0h and sha512sig1h instructions
> 
> Co-authored-by: Zewen Ye <lustrew@foxmail.com>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/insn32.decode              |   6 ++
>   target/riscv/insn_trans/trans_rvk.c.inc | 100 ++++++++++++++++++++++++
>   2 files changed, 106 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

