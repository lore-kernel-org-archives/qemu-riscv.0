Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcLmE-0007Gh-2Z
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 02:05:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcLlx-0007Em-3W
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 02:05:24 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:40937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcLlv-0002od-Gk
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 02:05:20 -0400
Received: by mail-pg1-x52e.google.com with SMTP id q5so14984133pgr.7
 for <qemu-riscv@nongnu.org>; Sun, 17 Oct 2021 23:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4GoNaO6cAr8P3L2u+cHY+4aP6OhACRc+y7aXts4nf94=;
 b=r4WTyBV7kWeANPz7SiXT3APGMeI1UsTVvd99SiW7v6kPu5ot0kAUn+EkvkbO7POTMh
 Lobxv6Pudu2V7CAZZmi3ghtI5tButW1mTuhWyg8aj37hVXoSiZOvpj2QKdZepAHDeV5g
 Sbfm4YUrm0susxrSj9IlonwWpoWy7FawClkA7vV2SwR9gHiKsR/SkaUiPLWlUOw5rEh2
 SQlZHpaUV3ZWaTegHdgFvdfkq56i/BmhYs9zOaTA+RHuOJH/5s+7ZWwh1mjodjbvRvvj
 jKfOsCB33dYqhfMitaR06exyeQpoHF4MsBv3RVfasaa8WqWJiTvCt6GgGZvmcIT2zVaq
 9fAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4GoNaO6cAr8P3L2u+cHY+4aP6OhACRc+y7aXts4nf94=;
 b=L9YR7SO6X7mag/4at5gtF5KtqaiJIHNZg9ITNyV4yptbRVrl9vu/glXx2vMiSxgVID
 qN/IFETdEpI22TMX52gX7cqSu9c7BPApOPJ2KY9aD37wUhQXLgYSg6LvLndMqHWNbYHP
 lEVGXqO7z9T3s8hB2ThzYV7JhM5Uu2Rjeww/pAGh4/gvQPjGSb/vNI8BCF/XMcvQL69O
 LFnPicMJt6+frrvnSggy33y2IRO7A9FfI71y2VcN6hJSlE6XxECWbb0SDbSTLtglAVfm
 iJjZTP0Bz593aSL63DPI/lKc5weltnBeEp+KXof2c14V4TZwxk+bg+AOaNW3i2Ayej1m
 qGxQ==
X-Gm-Message-State: AOAM531oIqZZcxa8COs/z2kyWZgW8RZrCd0XaxbcRPdMB/cKdQ/Utad5
 4FPCV2stqcOJL1LJ00/vPw5hHQ==
X-Google-Smtp-Source: ABdhPJwIXRUcIeievjSFGBYGEnJfL4MLGKKmIt/KuHZsMF6TOViuyJrSXzb8Z2utTl+CKelqlPIGng==
X-Received: by 2002:a63:81c2:: with SMTP id
 t185mr14382682pgd.114.1634537117937; 
 Sun, 17 Oct 2021 23:05:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g25sm3209531pge.12.2021.10.17.23.05.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Oct 2021 23:05:17 -0700 (PDT)
Subject: Re: [PATCH v3 14/14] target/riscv: Compute mstatus.sd on demand
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Fabien Portas <fabien.portas@grenoble-inp.org>,
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, liuzhiwei <zhiwei_liu@c-sky.com>
References: <20211016171412.3163784-1-richard.henderson@linaro.org>
 <20211016171412.3163784-15-richard.henderson@linaro.org>
 <CAKmqyKOZd-gtes+_sQ=ndjqu9nfujE_Kc==Jueno+ds6Pg7neQ@mail.gmail.com>
 <a9a1b623-0420-6285-0ad8-cf152a4e0397@linaro.org>
 <CAKmqyKOQ5UQgY0z2B5H+e5ra_cWz_JZKjtEmnm5er5gs7wWtQw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f2d38eb6-9eda-9335-fc10-86b06e374876@linaro.org>
Date: Sun, 17 Oct 2021 23:05:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKOQ5UQgY0z2B5H+e5ra_cWz_JZKjtEmnm5er5gs7wWtQw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Mon, 18 Oct 2021 06:05:29 -0000

On 10/17/21 10:38 PM, Alistair Francis wrote:
> Do we get much of an advantage from this though? To me it seems
> confusing that the mstatus register doesn't actually contain the
> latest value (for example when debugging QEMU and adding my own
> printf's).

(1) We have at least 3 places that need to check the cpu state in order to set SD 
correctly; we would add another couple with the VS bit that's coming in from RVV-1.0.  By 
setting this bit during read, we reduce that to one accessor for read.

(2) We would need to move this bit when changing MXL, once that's possible with the 
various XLEN changing patch sets.

(3) The position of this bit, between MSTATUS and SSTATUS, differs if MXL != SXL, which 
means that there is not really one correct setting for (2).


r~

