Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mf6OZ-00043L-Kh
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 16:16:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mf6OY-00040F-Ek
 for qemu-riscv@nongnu.org; Mon, 25 Oct 2021 16:16:34 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:54067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mf6OW-0005vF-Pw
 for qemu-riscv@nongnu.org; Mon, 25 Oct 2021 16:16:33 -0400
Received: by mail-pj1-x1032.google.com with SMTP id fv3so3149601pjb.3
 for <qemu-riscv@nongnu.org>; Mon, 25 Oct 2021 13:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mRmb+PfQhO6BcrzUcuETNG6tZDfhTb6sFLWMsok11p0=;
 b=mgJuj8MT1dLi5QINWvEizxVZXbQfamsW0/8QF6mGT3y0WjtE7H6yB9ibExsOVtn9Eu
 aWEOM29pQxj3YqOaV44whPXW8LtSBttVVPk7epyW5FHHE71u5xi0rfQ6Aqakpc5TnzYS
 fohwnTB3ypyKxoaT8kURmz0KcAtgjFpnJ3TxHRT4n6dX4tlqRX0YVowvsxC0mBOr4mqT
 g8GT0PDYLSAoCLs9PXaD3oYMeAkLmpU7K9LkFawG6NP/Ov1gGdZHFRDjnS763Vi8ucIm
 z5w2pi1hIpCFgA8LWQJbO9au3qsz1yBjds1vU5P19cb8xBpmmyQeqTeJlfmWPykjMDjX
 2/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mRmb+PfQhO6BcrzUcuETNG6tZDfhTb6sFLWMsok11p0=;
 b=bU0Bkk+a8Wa2cf2zBA+aCM8k35ISpMYlWVqLPL2F2Ujz3JkgCE7yJ0KBvNiqYK63Ny
 D/Ni7nbh8IqHCfVaW2xYxu4DOWB8aq2++lOSBg/Ca+PpN+7+pWwu0nRIKMTvDhxJkSZf
 Oc2RJhbWbbVDF5E0GN0II7fwJOeqxJO8CvCI5ANE3Bx1lec/iDAPlNXtfipNvh1sRFCc
 +o3tXilHhex9JWqVPQlixfgfOLHCAZD48XEZE2iq1c9TebEKcmKpCyETNrU5Kv4V1dmf
 Lc/xwBL0gAQdN4txofCEAECW0gc0/ywTtKeoDIxeXEEsUmlh/dRntvzwp48bRCZ9mzuw
 Hw7w==
X-Gm-Message-State: AOAM532dksR6TazIt4XwnVwoiLpj+z2PXCtYEBwZlP9uBIpG3fi/RFZl
 zxVVE6caAy5xXSmjJ8y4mFwtkg==
X-Google-Smtp-Source: ABdhPJw8Kc4HLHyC1yd9DSjJfaS4xmd7CBJNt4rg1jRDdo31ivmeMNNQCeRHcrbvUWMS9EHapUc5yQ==
X-Received: by 2002:a17:902:b583:b0:13d:e495:187a with SMTP id
 a3-20020a170902b58300b0013de495187amr18334534pls.9.1635192991205; 
 Mon, 25 Oct 2021 13:16:31 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id hf24sm4422975pjb.43.2021.10.25.13.16.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 13:16:30 -0700 (PDT)
Subject: Re: [PATCH v4 02/17] qemu/int128: addition of a few 128-bit operations
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com,
 fabien.portas@grenoble-inp.org
References: <20211025122818.168890-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211025122818.168890-3-frederic.petrot@univ-grenoble-alpes.fr>
 <3b78f982-74e6-fc04-edab-aa77bdb8f4c9@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <992619d9-a5a6-eb29-a176-2a0d87c83ede@linaro.org>
Date: Mon, 25 Oct 2021 13:16:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <3b78f982-74e6-fc04-edab-aa77bdb8f4c9@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.846,
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
X-List-Received-Date: Mon, 25 Oct 2021 20:16:34 -0000

On 10/25/21 8:47 AM, Philippe Mathieu-Daudé wrote:
> On 10/25/21 14:28, Frédéric Pétrot wrote:
>> Addition of not, xor, div and rem on 128-bit integers, used in particular
>> within div/rem and csr helpers for computations on 128-bit registers in
>> the 128-bit riscv target.
>>
>> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
>> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
>> ---
>>   include/qemu/int128.h |  26 +++++
>>   util/int128.c         | 218 ++++++++++++++++++++++++++++++++++++++++++
>>   util/meson.build      |   1 +
>>   3 files changed, 245 insertions(+)
>>   create mode 100644 util/int128.c
> 
> If you ever have to respin, please split the logical operations in
> one patch and the div/rem in another.

I have pulled out these logicals into a separate patch and applied to tcg-next.  I'll 
handle division relative to the PPC64 DFP patch set.


r~


