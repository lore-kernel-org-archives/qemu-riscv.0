Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpC16-0001XP-SV
	for mharc-qemu-riscv@gnu.org; Tue, 15 Dec 2020 10:13:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpC11-0001Ue-IQ
 for qemu-riscv@nongnu.org; Tue, 15 Dec 2020 10:13:27 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:39672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpC0x-0001H0-Px
 for qemu-riscv@nongnu.org; Tue, 15 Dec 2020 10:13:26 -0500
Received: by mail-ot1-x343.google.com with SMTP id d8so19660693otq.6
 for <qemu-riscv@nongnu.org>; Tue, 15 Dec 2020 07:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nUaNt9anjfpSzkGIFoDmdufb1XB/EvLgqnAkyz4hkNw=;
 b=k/PrklRtVy1RkMoCO1I4e2kpAHiwbqz9VSD5wDYGDQ4EbEMAAIICaLmOQhHh+rA3M5
 74J4cH14iHDQvYqPmTPByD+4kUPyFtXgpEnJH0dLW+JWgHM0Au15IYyXH8CVSUsaKR9P
 LmmjpzMPI4njprge86gLA8L82jcNlfrF6kgGx1fdFtM6ff3F1Ua9QKzCaBvOKhnk7Uzw
 jiUToY6xR8q+iheTgPzipx7EK2FXYG5teNJkInv/JE2t7GXorugQdevkvW248hkmH9qO
 ov1rhgRcwtC4vTgVSh4SgEvN6blo75o73JN/+3oEjyL42GnipX7ksVLHL9wMTXXWAPuj
 U/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nUaNt9anjfpSzkGIFoDmdufb1XB/EvLgqnAkyz4hkNw=;
 b=dSRbABjxtSKVrhQgBokpQ51WKICTZgw6+54c48LOckLnkRMXFr9dafZAGZmeGeLei0
 SvMVC/X1Fh1UdkHulSjvUR+V+YKVOnNTW8bfj5uOlzuLExlKUOEHiGAkxdw7UGFPhD3W
 6uM7DaLXwE63IsPNLnZodKxlo3SEBiBJ+8SXZbZL9qKR4jWTTz2b6UgCUqDYBUrRjSGj
 7WAHt1L+RJkYyAdbZ/IarlmkCthIy1B2nXDg6LfjYkJjolr34B5lB1BT3YScnG2DNkIJ
 dLk9MeWHkmSzwadM7T2gPYVvCWX+aB1yg4B8qGIyI/K9uH+gim1DTJuOSDEM2y6ADgTo
 hIfg==
X-Gm-Message-State: AOAM532PyOMEQRwXw1DlhN6Yxgv2FhX0Gw07GCIhPCFawm09vB+XgaT7
 mZNe56VnNPzsyKhw/UiuWgCbvg==
X-Google-Smtp-Source: ABdhPJx6oBcrxTxKsewDqhv2cP2MUkQZidT8on3uHtwLDOAzK5j4gIPFTRkcky8yeFeiDx+xqgvgnQ==
X-Received: by 2002:a9d:5f9a:: with SMTP id g26mr24135548oti.241.1608045202067; 
 Tue, 15 Dec 2020 07:13:22 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id 11sm462878oty.65.2020.12.15.07.13.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 07:13:21 -0800 (PST)
Subject: Re: [PATCH v3 09/15] target/riscv: fpu_helper: Match function defs in
 HELPER macros
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair23@gmail.com>
References: <cover.1607967113.git.alistair.francis@wdc.com>
 <2cffe9cb8055c9451872b3a08192e19fec12fb1a.1607967113.git.alistair.francis@wdc.com>
 <CAEUhbmUhKuhEPU=RyRN3CVYDh=oGoQF1e-tSX=jODw4c2Ub1kA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <97fe497a-06c0-43e4-3144-eee0c439686a@linaro.org>
Date: Tue, 15 Dec 2020 09:13:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmUhKuhEPU=RyRN3CVYDh=oGoQF1e-tSX=jODw4c2Ub1kA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x343.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Tue, 15 Dec 2020 15:13:28 -0000

On 12/15/20 3:38 AM, Bin Meng wrote:
>>  #if defined(TARGET_RISCV64)
>> -uint64_t helper_fcvt_l_s(CPURISCVState *env, uint64_t rs1)
>> +target_ulong helper_fcvt_l_s(CPURISCVState *env, uint64_t rs1)
>>  {
>>      float32 frs1 = check_nanbox_s(rs1);
>>      return float32_to_int64(frs1, &env->fp_status);
> 
> float32_to_int64() returns int64_t, so there is a truncation if
> changing it to target_ulong for 32-bit.

There's not, because this function isn't defined for 32-bit (see first quoted
line).  But this point of confusion is exactly what I pointed out vs the
previous revision.


r~

