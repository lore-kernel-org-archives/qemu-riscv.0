Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqy3Q-0000A5-KT
	for mharc-qemu-riscv@gnu.org; Tue, 17 May 2022 10:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqy3B-00005q-3x; Tue, 17 May 2022 10:19:50 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:37487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqy39-0006Q2-Jo; Tue, 17 May 2022 10:19:48 -0400
Received: by mail-ed1-x52e.google.com with SMTP id g12so7300516edq.4;
 Tue, 17 May 2022 07:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=697ZigkJFXSp40Ptzu/jWqVjxne9AOAKRj6OGmgvoyI=;
 b=UTuMQkW2znzD5QGMUSqrTh5omN7OmUdiDsiu4v/NuJwPgEqpbl9CQiGJ+K8hj4KBeU
 1U5BLgcI0PbuF1xhDZRSYjQt9JUEfo2x6tECbtqXO5aX486UJ4N5k34TbAPAdaymDoJi
 R1l5sr2PYHb5NH74Lr3i0LBiUD01Viw6s67Qfsvi8CwS74hZeb5ziDFAacXuHUKeH2fY
 psdxRCr+EXG13iEIYntCoEW8kNsd3i+TKTvonmsm2yepIbNlrBTBiRHffZ76+fSKglRX
 e+/7K0XK+PPCTMZs6XHYxNNTkhn1eRZ7V+L91T/INzkV6QaK3mWjQMwsDeDLZi8kd+PL
 Ka1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=697ZigkJFXSp40Ptzu/jWqVjxne9AOAKRj6OGmgvoyI=;
 b=Nldj/LEXxKwUMH+fNh4k3Y0U4TopCUQnGroA75DLZhfasaAUp8P9fbQnATH0zcmSXy
 xNQ6FBPsC0tDXqsmjEmoN8M9DO80XuFgAqT5EBZiF1ZBVaz515OSORoSsQ6E4tVUntZU
 HVlVScRq7GAp8b6kgjcy4q4gwYwYLxFLm5gHhXNe7KbTaSGH/76jCfzgSTipdHVqV8Z8
 YLjh+9S1iVI3wOot+quo3E5aLfkd2pHg6DweWtt0u/K4slpm1oU5rOuh5nSn3es3Xr5q
 VffcT67J5Qpct6kJ1fhSCGgz6uoY8Ka0/aO/GNMYNdmZrPxH/70d5El8rcQZr18Yu5qA
 ljKA==
X-Gm-Message-State: AOAM532DewmXgrZy4CAc8t7G2e3DsvorlJMChQae4gy/lb8y8s5rBOTj
 BUcmwFTbyk7dhxJs/esYnDw=
X-Google-Smtp-Source: ABdhPJwiAHiokerWbWJ5Qm/dSoZBo1KqrTMe23syqQVqme71FwSax0154L8altbhpcyeHrAaOwFXKw==
X-Received: by 2002:a05:6402:690:b0:42a:cf15:c69a with SMTP id
 f16-20020a056402069000b0042acf15c69amr1694426edy.416.1652797184902; 
 Tue, 17 May 2022 07:19:44 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 a23-20020aa7cf17000000b0042ab02e3485sm3673562edy.44.2022.05.17.07.19.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 07:19:44 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <99c9d25e-a69a-1db9-6ec7-f3348ac691d4@redhat.com>
Date: Tue, 17 May 2022 16:19:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 02/18] block: Add a 'flags' param to blk_pread()
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-ppc@nongnu.org, Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 qemu-riscv@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>, Stefan Weil <sw@weilnetz.de>,
 Laurent Vivier <laurent@vivier.eu>, "Denis V. Lunev" <den@openvz.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org, Fam Zheng <fam@euphon.net>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, Bin Meng <bin.meng@windriver.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113524.197910-3-afaria@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220517113524.197910-3-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 17 May 2022 14:19:59 -0000

On 5/17/22 13:35, Alberto Faria wrote:
> For consistency with other I/O functions, and in preparation to
> implement it using generated_co_wrapper.
> 
> Callers were updated using this Coccinelle script:
> 
>      @@ expression blk, offset, buf, bytes; @@
>      - blk_pread(blk, offset, buf, bytes)
>      + blk_pread(blk, offset, buf, bytes, 0)
> 
> It had no effect on hw/block/nand.c, presumably due to the #if, so that
> file was updated manually.

Whoa that's disgusting...

> Overly-long lines were then fixed by hand.
> 
> Signed-off-by: Alberto Faria <afaria@redhat.com>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

