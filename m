Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcLFi-0006by-Q5
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 01:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcLFg-0006bG-LN
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 01:32:00 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:55056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcLFe-0001BF-NA
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 01:32:00 -0400
Received: by mail-pj1-x102f.google.com with SMTP id np13so11394316pjb.4
 for <qemu-riscv@nongnu.org>; Sun, 17 Oct 2021 22:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JGZwShwgKrwz5GKrAYdmMeKE08mmQzUw0gujh+N8JpA=;
 b=Weid6OIPPQbz0NjqLZtIHdkxZkQ79dvxReK6VRAJEFtA1fF3T9+s9Tw3+DMwbzfxZB
 3zv0uUGVIQ/N6tHO7NmOaRK3QvOoHfFnfP/dvgtBbM64Dd2pcbwuorPdMW+tc9YcjvIX
 OP0ijq+/UzC7VEARzhQuXnHfU+NFGFkuJ/iWUCHRjcQkGgxaq5P0OHyivkPJgjWSIVL0
 hk8AQXy5zZL0a9aau1wWKOVhfSDZ8nv+OBo+sVYeuxmyYLEsi4d+wgKU+Wq76YWSO7bb
 s9fzbzUrfA9Udsi8WB878P/Pxyeq6rpCgL9HK9FvZkHrdvrpAh1+s7q1/YJzb3NqP7Ge
 7vlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JGZwShwgKrwz5GKrAYdmMeKE08mmQzUw0gujh+N8JpA=;
 b=RbqfhBqe+GKyo1XfURrwbr2WBQVE6oMhhNdmHXiECW60N+pumEwScg+kpv88078FrA
 ecuNafEC4GkdWGGBf5wEEU0uiaHYUptK9tV3AidPQgQOAZ8EySOqObwyaosONkjRaaZD
 EIEphpjRrPOF9h+cT/Bk1brwBZkba3B26PHy59txe7mDOtn64JmFXkGpkLtQz0sTEPEW
 lGojhqHqUJz4/CabXUXl1nNQj7pgeEQlo1K43ex6cuFzwWic/xzwMwqFJpuHmw+qbD98
 lNzAjI4AUuPBJ9yPa0CWiV0VmodhxIxIf+FinZABX1sAiCfWIjIDKfBmZD7ZY36cBciW
 h5Wg==
X-Gm-Message-State: AOAM530DKUPTjasiGkUI3ae37srq0qgRYIi8n9moCZZw6jOa+MKIcKPf
 mnM9tfebH5vpvWk8KXNYv049PQ==
X-Google-Smtp-Source: ABdhPJwAVEElnScyna0RgrJ+wENwN6aP2K7y+KQEXZTxl8EJkrNHZMUAJVal7MP1JIAoIjOxCYNezg==
X-Received: by 2002:a17:90b:3786:: with SMTP id
 mz6mr44340924pjb.245.1634535115805; 
 Sun, 17 Oct 2021 22:31:55 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id i2sm12356090pjt.21.2021.10.17.22.31.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Oct 2021 22:31:55 -0700 (PDT)
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
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a9a1b623-0420-6285-0ad8-cf152a4e0397@linaro.org>
Date: Sun, 17 Oct 2021 22:31:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKOZd-gtes+_sQ=ndjqu9nfujE_Kc==Jueno+ds6Pg7neQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
X-List-Received-Date: Mon, 18 Oct 2021 05:32:00 -0000

On 10/17/21 9:52 PM, Alistair Francis wrote:
> On Sun, Oct 17, 2021 at 3:32 AM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> The position of this read-only field is dependent on the
>> current cpu width.  Rather than having to compute that
>> difference in many places, compute it only on read.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> This means that the value reported by riscv_cpu_dump_state() and GDB
> will both be incorrect though?

Yep.  Missed those; should have added another accessor.

Also, for the record, it changes the vmstate, but since a previous patch in the series 
bumped the version number for the split on misa, we can call all of a piece and ok.


r~

