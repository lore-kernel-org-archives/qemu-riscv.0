Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAxlJ-0001Qb-VM
	for mharc-qemu-riscv@gnu.org; Thu, 19 Sep 2019 10:50:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59001)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iAxlD-0001MW-CS
 for qemu-riscv@nongnu.org; Thu, 19 Sep 2019 10:50:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iAxlB-0002FH-FY
 for qemu-riscv@nongnu.org; Thu, 19 Sep 2019 10:50:18 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:33064)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iAxlA-0002Db-Uj
 for qemu-riscv@nongnu.org; Thu, 19 Sep 2019 10:50:17 -0400
Received: by mail-pl1-x642.google.com with SMTP id d22so425041pls.0
 for <qemu-riscv@nongnu.org>; Thu, 19 Sep 2019 07:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wBnU7eQH7P9dq4SImhH4m+UMr+hvTy4A4AU61yNo/3Q=;
 b=gabaamDJqbVBPQ5OaB4VLzMvr0A8cOkh+P/+ET+m7UIaDLZ2O9q+xlLIOdUe2tLuqa
 8XTs6UtDBdkuOWZqPmSUGufX6Ocu3v6wrICglV31n46T64ptZa0hrABRhq3hwIfGoR2I
 6chrxZLQXDMqAnRFl2MgnwODFRrqnZhKaFmOZ2o38QGdDTntYLs1ufjOHezhxetItDv/
 uYNdWwX3vkNCsfLuFWUHOi/J5AtsAWwq/vrF+4tICZCKFszOuhP253ZUCUrieg7/J7Y5
 8deEfiEhnJ+8FRLUFItbH2PsAORjf1VeITF7AZWl2he78V8J79T+kUflXnPmDUqyKOyp
 VEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wBnU7eQH7P9dq4SImhH4m+UMr+hvTy4A4AU61yNo/3Q=;
 b=VnvIZCSQT8KJ6c2Ozso98bJLryEWEp9ecKmV6vP0BVi6wgpk/gGah64LFyqrHl5tHl
 9yqfP5XUnG/FBKslDM7irWyh55vEs9HkOJz6lGh2X2Tb15k1UoFYdiqSzDrpZ7mtSGYL
 mVBTRfl+63Ewqo41WZYCPa/j+4L2IM0VgsQR+CgSbaIvBF3eG8MY3jZke1+qxYGWqmR3
 5fsUNkWCLBaav1y7wCWcqB5AsIJwNACpxFDqbjJeVQbLKhJ7QLoBaXm7OjmwlCgNSpcq
 AAnIuGriVUYE9YTmtC1FoCif7ETMGBKaJg3BVn8E0Zz0ywxIKMs1wADxv3bOEbV2gMws
 aIPg==
X-Gm-Message-State: APjAAAXanxo0+nDUkEafj+hb5ZRxS/a2WuvRorLqr+3Y6mEUXvkX1ImB
 4Rp77j4oYGEuG7KD5pEj7qPcwg==
X-Google-Smtp-Source: APXvYqwqsuul27S5q5PuartbeWbNJL8et0wV8hhDiLroFlUV+MrmjNXM4uizdwfm1AgLdYs3Gw15AA==
X-Received: by 2002:a17:902:6b84:: with SMTP id
 p4mr10618381plk.168.1568904615163; 
 Thu, 19 Sep 2019 07:50:15 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id s141sm10546361pfs.13.2019.09.19.07.50.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Sep 2019 07:50:14 -0700 (PDT)
To: Alistair Francis <alistair23@gmail.com>,
 Jonathan Behrens <fintelia@gmail.com>
Cc: Palmer Dabbelt <palmer@sifive.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Anup Patel <Anup.Patel@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
References: <850360df8fc15a3671bf2237f972ebaf09110015.1566603412.git.alistair.francis@wdc.com>
 <mhng-b813f03d-c23e-405a-8213-c4c9b22a6831@palmer-si-x1e>
 <CANnJOVFNqXEg9KkJC4CHkt0KTt2_6HjyhU2CvMROW+e79mDncA@mail.gmail.com>
 <CAKmqyKMfODSjbBm5ZgmHYYzzrf3B_4WEbANeKXo6rSO6V5Pzeg@mail.gmail.com>
 <CANnJOVGPW1ppNdx+=KAvgNhgGQPvJxjyGY=rxunicu=f++xhiQ@mail.gmail.com>
 <CAKmqyKPQPrPKdkaRjZ7P75jamuqEq6BABir56VrYGm=ZSFpAww@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <18b87754-d5b2-e4f1-bdc5-92ad26b97379@linaro.org>
Date: Thu, 19 Sep 2019 07:50:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKPQPrPKdkaRjZ7P75jamuqEq6BABir56VrYGm=ZSFpAww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v1 10/28] target/riscv:
 Convert mie and mstatus to pointers
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
X-List-Received-Date: Thu, 19 Sep 2019 14:50:23 -0000

On 9/18/19 4:47 PM, Alistair Francis wrote:
> I'm not a fan of the pointer method that I'm using, but to me it seems
> the least worst in terms of handling future code, keeping everythign
> consistnent and avoiding complex access rules.

FWIW, I prefer the "banked" register method used by ARM.

enum {
    M_REG_NS = 0,    /* non-secure mode */
    M_REG_S = 1,     /* secure mode */
    M_REG_NUM_BANKS = 2,
};

...

        uint32_t vecbase[M_REG_NUM_BANKS];
        uint32_t basepri[M_REG_NUM_BANKS];
        uint32_t control[M_REG_NUM_BANKS];

The major difference that I see is that a pointer can only represent a single
state at a single time.  With an index, different parts of the code can ask
different questions that may have different states.  E.g. "are we currently in
secure mode" vs "will the exception return to secure mode".


r~

