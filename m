Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njVsr-0005Gr-5P
	for mharc-qemu-riscv@gnu.org; Tue, 26 Apr 2022 20:50:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njVsn-0005Fq-Qt
 for qemu-riscv@nongnu.org; Tue, 26 Apr 2022 20:50:17 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:41620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njVsk-0007Zk-Ff
 for qemu-riscv@nongnu.org; Tue, 26 Apr 2022 20:50:16 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 z5-20020a17090a468500b001d2bc2743c4so486759pjf.0
 for <qemu-riscv@nongnu.org>; Tue, 26 Apr 2022 17:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YIBAIFdgrdd04aIpjbro4LSbtnIgMlOoJ2JZP8eblHo=;
 b=EtajBLg+Vklulym4BLIOkRXDBqujQbhPDOH2SjiueJ3+9fvUL09ChFLb2A09GsOzuE
 rUJAZart+tbS/zg5BnJ8RdzRoyZybekn7Y7nHahw6zzq224B8wqsoibegtqLW7npc3MO
 Xu3EF8jKwWmOOWs7XhbP+PJmfcEDiJFnOy+DTERzXw2jxocE9YKfxm1UWPj5yPBb+8zk
 N57wNUEHb/SMucuFNJ399ltvksU2rq0zwA10GP/rgPrR5bG2u6Fa0cEwiKZGtxC7CBVX
 y0qCoPkG5jRvrwxnCbGtGfxBe+XpIupqTl9b0IFUatR7DRHUHHAuBhovEHSvJJ9B2Nzu
 NEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YIBAIFdgrdd04aIpjbro4LSbtnIgMlOoJ2JZP8eblHo=;
 b=yT+1wH0/mddt5J5eiMiIZsWJEf3yudiBaUUw81W3n3V+JA4j93bO4hxTeUIPThdrIy
 iqi82dirdBeuB0t3x4feNYLGoS+dCFeL0Hlb5f5z5NrHlRgEUfbN6fbwD0h+ZepFx2YT
 ZBF/txC27ms3aJpJTxWbFfb9196IpSnp+D+Nyw+AE6dBZvBtFrx5AzC+Hhau+uy3ccrM
 MQfSl7i+/ViayBkv1xgF6a9JKPdYhXMxg8r/Bn7acYFHHU8w7pTYt1svqLUHDMyHh38a
 OiRbfVWwAZgPXM5xdArSm8nXJQNZxd5OrM01u0AmFtxVxzmSQKmxKoeoSSHAkNONhJ3q
 yQvA==
X-Gm-Message-State: AOAM530nB6gJKw6t2phFF7uZ14UKNxVXSSdp6+hl9mm/os4Atoq1CKZN
 eTN/4xJAHsxrdagFzxmtxCtmAw==
X-Google-Smtp-Source: ABdhPJzhRIpTcrsAfLR/gguW3RdyVByRJOa0QJUsXnumab5e+gDZsM3vedCFWnF8mW5HZ3yXMpmKcQ==
X-Received: by 2002:a17:902:eb84:b0:15d:f53:ead0 with SMTP id
 q4-20020a170902eb8400b0015d0f53ead0mr14216232plg.150.1651020612385; 
 Tue, 26 Apr 2022 17:50:12 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 n21-20020a056a00213500b0050d345d8e2bsm9940913pfj.162.2022.04.26.17.50.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 17:50:11 -0700 (PDT)
Message-ID: <68ce0082-130b-ed22-8d8b-04878552ba2d@linaro.org>
Date: Tue, 26 Apr 2022 17:50:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 2/5] migration: Add 64bit variable array data type
Content-Language: en-US
To: Atish Patra <atishp@rivosinc.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20220426230855.336292-1-atishp@rivosinc.com>
 <20220426230855.336292-3-atishp@rivosinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220426230855.336292-3-atishp@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 27 Apr 2022 00:50:18 -0000

On 4/26/22 16:08, Atish Patra wrote:
> +    .num_offset = vmstate_offset_value(_state, _field_num, uint32_t),\
...
>       } else if (field->flags & VMS_VARRAY_UINT32) {
>           n_elems = *(uint32_t *)(opaque + field->num_offset);
> +    } else if (field->flags & VMS_VARRAY_UINT64) {
> +        n_elems = *(uint64_t *)(opaque + field->num_offset);

Offset type mismatch.  Since num_harts is uint32_t, I don't believe you need this patch at 
all.


r~

