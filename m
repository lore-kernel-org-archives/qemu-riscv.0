Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hpb4j-0007wu-Bq
	for mharc-qemu-riscv@gnu.org; Mon, 22 Jul 2019 12:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35097)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hpb4g-0007qW-T9
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2019 12:22:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hpb4f-00036g-OW
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2019 12:22:06 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52128)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hpb4f-00034p-Gd
 for qemu-riscv@nongnu.org; Mon, 22 Jul 2019 12:22:05 -0400
Received: by mail-wm1-f65.google.com with SMTP id 207so35821683wma.1
 for <qemu-riscv@nongnu.org>; Mon, 22 Jul 2019 09:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PwkBfELRJL91fx59DzQCj2IthEohyTfywm5LOq0HTjY=;
 b=EOvD1xQd+cZLXFDxOxplPv6++wRp3fRz3GsfDD69t8yhLTSOPL5fVyk7yka1qE3JMs
 LikWRGrztJv1c4cXUGTGlaImH7aMHtylYkKkrYumgYgwLCJa0oE4UsZaRA04nF58Espc
 hPtXxFUTAB5uprUlvj5rzQblASH1JJm16AyQjvokoeO9pFO0+v5jcMlxGad60+maq3W4
 3XftXy8wV+lHK5sbpm8fqzcKE1IjXEmcYoLjWWLHIJyMfh+UrKT5gprmOmpRXVkrvX7O
 R2GrMGdDAD9Awu1xdXxHBvpbdYNmaLhVQWrHdgpo9u4cqXAAkZ5AaVFRMnajQ6Dqnn1Q
 R18g==
X-Gm-Message-State: APjAAAWWrHkQLcjekobcIohJTYqdxjo+UpEYC/S/3yD6viKBxQ9UkC30
 KVTOO0uVGiK9okfAg+RscetUMQ==
X-Google-Smtp-Source: APXvYqzVbN/9qCk6k12I+RjtFvuKLRQtqZx/TDS8NdgVZpmyecLuZkaVi7Cbh9ECVCmB8l7vkuwOjw==
X-Received: by 2002:a1c:5f55:: with SMTP id t82mr63522468wmb.111.1563812524125; 
 Mon, 22 Jul 2019 09:22:04 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:10f7:67c8:abb4:8512?
 ([2001:b07:6468:f312:10f7:67c8:abb4:8512])
 by smtp.gmail.com with ESMTPSA id t185sm33448143wma.11.2019.07.22.09.22.02
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jul 2019 09:22:03 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, tony.nguyen@bt.com,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, walling@linux.ibm.com, david@redhat.com,
 palmer@sifive.com, mark.cave-ayland@ilande.co.uk, Alistair.Francis@wdc.com,
 arikalo@wavecomp.com, mst@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, rth@twiddle.net, atar4qemu@gmail.com,
 ehabkost@redhat.com, sw@weilnetz.de, alex.williamson@redhat.com,
 qemu-arm@nongnu.org, david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 cohuck@redhat.com, claudio.fontana@huawei.com, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, amarkovic@wavecomp.com, aurelien@aurel32.net
References: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
 <2b6eb033-4b6e-4d64-c57e-a3257088d0dd@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <d6726b14-96e6-4a96-41b2-598c90289b88@redhat.com>
Date: Mon, 22 Jul 2019 18:22:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2b6eb033-4b6e-4d64-c57e-a3257088d0dd@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 00/20] Invert Endian bit in
 SPARCv9 MMU TTE
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
X-List-Received-Date: Mon, 22 Jul 2019 16:22:07 -0000

On 22/07/19 17:59, Richard Henderson wrote:
> On 7/22/19 8:34 AM, tony.nguyen@bt.com wrote:
>> Tony Nguyen (20):
>>   tcg: Replace MO_8 with MO_UB alias
>>   tcg: Replace MO_16 with MO_UW alias
>>   tcg: Replace MO_32 with MO_UL alias
>>   tcg: Replace MO_64 with MO_UQ alias
>>   tcg: Move size+sign+endian from TCGMemOp to MemOp
> I don't like any of these first 5 patches.
> I don't understand your motivation here.  Why?

He wants to avoid namespace collisions between MemOp and TCGMemOp, I think.

Paolo

