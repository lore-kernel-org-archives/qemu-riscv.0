Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1piQCJ-0001CR-RX
	for mharc-qemu-riscv@gnu.org; Fri, 31 Mar 2023 21:38:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piQCI-00019i-Mc
 for qemu-riscv@nongnu.org; Fri, 31 Mar 2023 21:38:26 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piQCG-0007Rk-Sy
 for qemu-riscv@nongnu.org; Fri, 31 Mar 2023 21:38:26 -0400
Received: by mail-pg1-x533.google.com with SMTP id d22so14498519pgw.2
 for <qemu-riscv@nongnu.org>; Fri, 31 Mar 2023 18:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680313103;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qMm3xBAVSDpsL76gwomXVIF+8DHQX1Y2MtrdPm6elHw=;
 b=TuFmkTOeCA3BqNpWmIrlHNtXOM5nRW385BZPh9IrhwSxXDXRBUtZFJKuh85QKsqySS
 x34ACWewit6zxOnKNWyQ1V4UQ9Kdr9/vRc2fIQ6vDxwMeyfaD8GooAqwuy2bH7rDnToG
 xw9PTF7w5OelJOaHE7CQ4mUbljT+MQAy/6P2eZ6p2yuAe+S5PY3HRM0eHJAuWkqJKyLa
 AxpKO1Q/+AF3wlBoWquwR2G5ReiyD0LM9LEO5KUHr5GBzzzAnLDgzIg3sY6u+uZSQ5Fo
 Y+BXox4PEhqLujDk2YzFFl1GEkbbUhQuGm1KbDk9sPuptP+q2sAiuMwi69PekzS1BZI1
 aDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680313103;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qMm3xBAVSDpsL76gwomXVIF+8DHQX1Y2MtrdPm6elHw=;
 b=QXM17PFBi/a3zOjWbopfMJeYba1a661XnJQzwc0SGfT42Ihkn9RDFFV1LTwvLqOTAh
 8u5aNljpqa0F2tpmpRFlmOse8N7T3Jpg5jU4JvV0ffz3dqm3+6QswK2gKFJ628qFVoBo
 c1TJGmO+OX6IEACv8tYkGX7DighG7t68sXIMBaQEXZFc7l/zCTdaud7yDTqUldVLnvrx
 To6i7K9BAL/RUhVDeGcwkWBt8aMJvAPG0w4gksdA1uO8AUkassi33GEwTpvOBwCqoOoz
 woWIysddiFOvPMtGeYcuYqcpnRwHD5NdBkCRC1z7AKXavCjY9VPT9L0hBKxjym9FCp6P
 7IyQ==
X-Gm-Message-State: AAQBX9dnhrqJHml9GgvGRgZgOKM9m/u/5Vq+pvm5zgU7mZfWfWPRErrk
 mnPQxshlGXREGGJzP83lZsPbXw==
X-Google-Smtp-Source: AKy350Z+ODPeAAVamb1kJDD7tVhddf5ngv3kb3vG7CQAauN3VhqNrea5qU6mGc3vaOAbZFsqVdYSlA==
X-Received: by 2002:a62:1c04:0:b0:625:d697:c386 with SMTP id
 c4-20020a621c04000000b00625d697c386mr26870632pfc.22.1680313103024; 
 Fri, 31 Mar 2023 18:38:23 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:b714:1fce:85fa:2fc7?
 ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79042000000b0062ddfce5cdbsm2237369pfo.45.2023.03.31.18.38.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 18:38:22 -0700 (PDT)
Message-ID: <aa528f53-c629-faa3-8db8-ea045cf1a375@linaro.org>
Date: Fri, 31 Mar 2023 18:38:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 5/8] accel/tcg: Fix overwrite problems of tcg_cflags
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230331150609.114401-1-liweiwei@iscas.ac.cn>
 <20230331150609.114401-6-liweiwei@iscas.ac.cn>
 <054b85f3-5ae8-9215-f9af-d3c55126e552@linaro.org>
 <6c0ea9e4-4f5b-9384-7b48-ded2998f9204@linaro.org>
In-Reply-To: <6c0ea9e4-4f5b-9384-7b48-ded2998f9204@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 01 Apr 2023 01:38:26 -0000

On 3/31/23 18:33, Richard Henderson wrote:
> On 3/31/23 18:18, Richard Henderson wrote:
>> On 3/31/23 08:06, Weiwei Li wrote:
>>> CPUs often set CF_PCREL in tcg_cflags before qemu_init_vcpu(), in which
>>> tcg_cflags will be overwrited by tcg_cpu_init_cflags().
>>>
>>> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
>>> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
>>> ---
>>>   accel/tcg/tcg-accel-ops.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> Fixes: 4be790263ffc ("accel/tcg: Replace `TARGET_TB_PCREL` with `CF_PCREL`")

Queued to tcg-next.


r~

