Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njVuB-0006s5-TQ
	for mharc-qemu-riscv@gnu.org; Tue, 26 Apr 2022 20:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njVu6-0006oL-Nj
 for qemu-riscv@nongnu.org; Tue, 26 Apr 2022 20:51:39 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:39543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njVu4-0007ll-SO
 for qemu-riscv@nongnu.org; Tue, 26 Apr 2022 20:51:38 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 bd19-20020a17090b0b9300b001d98af6dcd1so3629760pjb.4
 for <qemu-riscv@nongnu.org>; Tue, 26 Apr 2022 17:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=W2DvTF/BOGGBdbW2we2U2e7KrkZ6zxSF30ORtrqHpaY=;
 b=fDG6p8g5Fatrgv3CIqEpWN1RPOLRAa34lWENSB+TBVWSssGA+GZENkVnmxptQpe3SP
 qRmoZeoQT/4b6nJyGOYvL7gIire6m6sW6id+5kkZTWspfkEsqaQOIwUvbmCxP5fzPcEG
 lRfPPjtp1ng4/msPSoYitygjJ92P/d1RJI4aVFUE+8TSmiImFpUb7sn8VF1CBETxLREv
 H8lHR0C9mlxIsa67SqUtRN74fKYrms0YUWudv/8ti/Zhec86/zjx+R3lYxTqfFVpov26
 SegkOWlLbsJJPhyHvfhIc1SQXk1VKz2mrylC5pSA8LVYZPViOLu78otOJfpiD53nZi3n
 9r1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=W2DvTF/BOGGBdbW2we2U2e7KrkZ6zxSF30ORtrqHpaY=;
 b=MxJLA8PhYUqRIHl5JsijLXEhEVtqQzG7ezgklaX+14AlRqGDs4acjB2DDSBt06/3HE
 ST3dAwJNhhqSXSRsxCFBqH4zrnlM4KtXmYFTwXE1RxXgYWGW1a9/VJNKqGzprGsHRl/a
 C7a4OS6KAOs/7z3ZNqD4daeqLpmqY0tI39Yju7r4E6WN2PDh6WA6IIQHM+4uCYBcu1Ug
 bkjI/cKt0tUNmHuJs2an/DuKoxNLtXHsnhsCLuoUMd6gacMwx6ik0lKFvu1YmUXa3bdm
 urg32vDkStEicShUQwtK9pIDX6eWBNAT9tbVkF8kfOoCsovSjx6ppyuhFYgDhrFJhILE
 hSJQ==
X-Gm-Message-State: AOAM532BdtPEGCQBhItmnWKtfdaUBejTfia3HA0WxlLSS7Cbukfth+gG
 DRFY2EzDoDdwT4oW1AbXc/IwdQ==
X-Google-Smtp-Source: ABdhPJx64wll+CoIlLc8tu2KXXDtvUOb9DR8LGSpT6BJkfQWOQW6I4miKe70ASiXwDk0QPGgS1e9Pg==
X-Received: by 2002:a17:902:aa06:b0:158:f13b:4859 with SMTP id
 be6-20020a170902aa0600b00158f13b4859mr26098257plb.141.1651020695471; 
 Tue, 26 Apr 2022 17:51:35 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a17090a639300b001d945337442sm4498964pjj.10.2022.04.26.17.51.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 17:51:34 -0700 (PDT)
Message-ID: <aa261bdf-b71e-1343-a443-752129f4b896@linaro.org>
Date: Tue, 26 Apr 2022 17:51:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 3/5] hw/intc: Support migration of aclint device
Content-Language: en-US
To: Atish Patra <atishp@rivosinc.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20220426230855.336292-1-atishp@rivosinc.com>
 <20220426230855.336292-4-atishp@rivosinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220426230855.336292-4-atishp@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 27 Apr 2022 00:51:39 -0000

On 4/26/22 16:08, Atish Patra wrote:
> mtimecmp is part of ACLINT device now. This needs to preserved across
> migration.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

This must be squashed with patch 1.

> +    .fields = (VMStateField[]) {
> +            VMSTATE_VARRAY_UINT64(timecmp, RISCVAclintMTimerState,

And this must be UINT32 to match num_harts.


r~

