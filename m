Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhZ5q-0001kE-4p
	for mharc-qemu-riscv@gnu.org; Thu, 21 Apr 2022 11:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhZ5o-0001am-4w
 for qemu-riscv@nongnu.org; Thu, 21 Apr 2022 11:51:40 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:53096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhZ5Y-0003P1-3e
 for qemu-riscv@nongnu.org; Thu, 21 Apr 2022 11:51:39 -0400
Received: by mail-pj1-x1029.google.com with SMTP id 2so5337042pjw.2
 for <qemu-riscv@nongnu.org>; Thu, 21 Apr 2022 08:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=67/QV1yAGcRR87XpoUU3m70XruMHLVC6p00b4NEIViE=;
 b=CVkk0nSNU/l91sjooi9/XPrjHdkIqPbUlgxmUy3qW8mHdek3ulO565Yhc3fN4uhaOi
 9nnFhZkg+XS92BXI5iEVQWEv1V5RB2gN77R42TN/+QCAKoQ8lIL9qz4vKgZ/llGVDhfi
 gOutFi35ugZXCNYDagneP5ufVNGNZ+ixUWI2ThZijh6ZojztV2kXoScnxBFbzBKLPkpg
 I8MhZQZkvnx5HrmVr7fOCtEassHlrTCuU63XOAn+hIXkiaUra95F6Cjdh1FqdVcy1MbI
 Da9TZN/TetohGOe9yXTr7lS8znnAjpifFyc280+9szQluTeRLFC6C7wSlPiTzqqu6KKO
 v64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=67/QV1yAGcRR87XpoUU3m70XruMHLVC6p00b4NEIViE=;
 b=pmLd3Cj6Y5XcN+BMO1+Pz/AGIHx70SkCBVgTjRr38VDPr4XnD9WOfgn9Vt3Pp99py6
 BQY5C3BNjk9Df/ObfoWq68YBuINeYuvrMFzBRID/mNlkmjDfB08pE7TNshQK86NhUCwb
 L6XDKru0RrUDw+mCfi6uo2ItQdOTPmMqayw8UyZgNEg6mX+7Y5dmElbRgjwbFkIHPFlG
 fpQrUa9xBvelBhP2NliVP3VpAsPuUUiQMQ0B+C58l2KftZ5GlD/3q0bAFLnmSYe6BNZj
 TaA4pVh7c/1he6uG3Yea5l5uuTm3BvHkP4xI6QroQ6fiXUWF0miKFWeqEA0iQFZ9FYLW
 ZtZg==
X-Gm-Message-State: AOAM531OhdMyEKzKNRqtnEATserqxvRuAH66GxuvvrhMRLxHtXAvm/gd
 r/97ncOkbJkJWZobTr95QsNRMA==
X-Google-Smtp-Source: ABdhPJyKAin0eP973XW3XwBj1kBNDWUn6xQsmm6fNG+T+ErunluQoBx9qyL0rp3ID4hLFN4AxJ+dSQ==
X-Received: by 2002:a17:902:8504:b0:158:914f:ca3 with SMTP id
 bj4-20020a170902850400b00158914f0ca3mr26444767plb.67.1650556282642; 
 Thu, 21 Apr 2022 08:51:22 -0700 (PDT)
Received: from ?IPV6:2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18?
 ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 z11-20020aa7990b000000b005061fcc75b6sm24333386pff.125.2022.04.21.08.51.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 08:51:21 -0700 (PDT)
Message-ID: <99634d32-2ff0-cf9b-14a5-02254d878443@linaro.org>
Date: Thu, 21 Apr 2022 08:51:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 2/7] target/riscv: machine: Add debug state description
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair23@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <20220315065529.62198-1-bmeng.cn@gmail.com>
 <20220315065529.62198-3-bmeng.cn@gmail.com>
 <CAKmqyKMoRqbfSsUNM1O1cQGHaL9rc6fsCqJxEktQNrgrLCimgA@mail.gmail.com>
 <CAEUhbmX0SdEcD8UWJUmmPm2SubT6gd991jNMAZJA8WFbRsdoaQ@mail.gmail.com>
 <CAEUhbmVrUMS638bbA+pnoHgeQdRc9KkBGb21wXD+2A8=RHbqwA@mail.gmail.com>
 <CAKmqyKMUP8QL=D781FnOjDrLXBxor5Qz5uG35cCw=C7aOLh2Ww@mail.gmail.com>
 <CAEUhbmV5xDOYFUp=FidQnR8rOU9pM1=5Zo3TDKgEyOUDFeu2LQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAEUhbmV5xDOYFUp=FidQnR8rOU9pM1=5Zo3TDKgEyOUDFeu2LQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 21 Apr 2022 15:51:40 -0000

On 4/20/22 16:46, Bin Meng wrote:
> It seems you were trying to build every commit for bisectabliity? Is
> there an easy way to do such automatically?

git rebase --exec "cd build && make"


r~

