Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1Ykt-000265-Ph
	for mharc-qemu-riscv@gnu.org; Mon, 18 Jan 2021 12:55:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1Ykp-000224-NC
 for qemu-riscv@nongnu.org; Mon, 18 Jan 2021 12:55:53 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:33944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1Ykh-0002vr-OH
 for qemu-riscv@nongnu.org; Mon, 18 Jan 2021 12:55:49 -0500
Received: by mail-pj1-x1033.google.com with SMTP id my11so222406pjb.1
 for <qemu-riscv@nongnu.org>; Mon, 18 Jan 2021 09:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SE8vf9eW3SnOLCOT2l+Ewm+uuWHLP0vI5RKOCNL6ErA=;
 b=hDpm9JT1/UhY4UC3Gfj5B3666m4C4vIHiPebdV04kHBEFycKJK5KmFlBklM4EOx5oo
 UvX5pRbldpEj54E5Uyf/qqgjJ2k2c17xcM5QVxX99nqucqi0HIC4e+PoQCgyZCSCWSXG
 hs4BCqrd5wuvVHJnzHBOASi19gmtg/xQEVgCqQknvqHaHcViyLyd5XZLh3Q9eIY/MqsW
 IJFKp2fjqX3GyhH2cLvJUEwIpCEy4R+Hfc9kTW1aHg05k87ba5H7IVCZVERGEZP7fVHI
 Czv3pzw1aFNzkG7U0B/ubFaFs6EcdmmYwcuEn60YeMh7nslzPrBh4K9d2TsuvlkASsV/
 NR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SE8vf9eW3SnOLCOT2l+Ewm+uuWHLP0vI5RKOCNL6ErA=;
 b=CbxljfXGQqzGWzkDKODZShTlOzWnSIqyCF2svGikb3j79dNZFkWYnpVhzHN0/cJbnl
 x02izKII4ARnF+XKJD8+A+np02ugDawwrIHHnHcKjxSqkkWGT3BUi1c5zyfoZfNoKBx3
 sx+MkQXJQb6SooK+dQ3ldiGVIVDtbjbahl35SjijyddTLN6VubBfaFvD5mRccCyW2EHd
 WqeVsADqxvneVWBAAPibbmFflMqJDil7PKb7DbEKjXsGDJSqLO3Huc2OI6Z3LsU2yASC
 xkKppQcibhrJ3QwMPHdMHnCkHRczV/6zEPDUj+INWBoeOIHDWWr163T+/2a2tZ7yIrHc
 MB2Q==
X-Gm-Message-State: AOAM530gJkKyLtBvrzj6aDF5FHC8TRi4/tPwUbIUzR6827sqUvN9Gc/p
 nTnn64TfyDiUerbsk9Z2OzAgJQ==
X-Google-Smtp-Source: ABdhPJxhb07BKMCdI6+mB2vDkiO6FvJY2x/0ch03DBI6coGDsBt4I7LsWwkkpsfmuo/wKfwEI9YOvQ==
X-Received: by 2002:a17:90a:d249:: with SMTP id
 o9mr479378pjw.196.1610992541039; 
 Mon, 18 Jan 2021 09:55:41 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id b2sm16702799pff.79.2021.01.18.09.55.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 09:55:40 -0800 (PST)
Subject: Re: [PATCH 1/4] target/riscv: Make csr_ops[CSR_TABLE_SIZE] external
To: Bin Meng <bmeng.cn@gmail.com>, Jim Wilson <jimw@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Cc: Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <1610427124-49887-1-git-send-email-bmeng.cn@gmail.com>
 <1610427124-49887-2-git-send-email-bmeng.cn@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5bb89965-266d-d789-bd64-a963559ea28f@linaro.org>
Date: Mon, 18 Jan 2021 07:55:37 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1610427124-49887-2-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.194,
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
X-List-Received-Date: Mon, 18 Jan 2021 17:55:53 -0000

On 1/11/21 6:52 PM, Bin Meng wrote:
> +extern riscv_csr_operations csr_ops[];

You might as well use CSR_TABLE_SIZE here.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

