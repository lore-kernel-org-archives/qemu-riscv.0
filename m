Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n29pT-0006Rd-UO
	for mharc-qemu-riscv@gnu.org; Tue, 28 Dec 2021 05:35:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n29pR-0006Oj-Sq
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 05:35:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n29pQ-0000OT-Bo
 for qemu-riscv@nongnu.org; Tue, 28 Dec 2021 05:35:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640687735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=plkme+8aCCTJ0si042HHRfHq8u78GI0L1XGN9yC+/6o=;
 b=YbMQnbctrzdWIowqyE7MbkBrIN8M8zg6WnrKzciju8RqQiqrNaAd/6GmeWSZeMJBxkRJdB
 kboiOIWAeymW3sxl2ZaHV56fOuPL3DBaOlR0xHODgfLi79CuG7BiEuR2Hq4dHhFihOYC+r
 snFpLCNdg+Ejr6afQ2HGy9Fzp67U3Zc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-lbJ80aLTMzK5jgKm_w-dZA-1; Tue, 28 Dec 2021 05:35:34 -0500
X-MC-Unique: lbJ80aLTMzK5jgKm_w-dZA-1
Received: by mail-wr1-f70.google.com with SMTP id
 v6-20020adfa1c6000000b001a26d0c3e32so3802162wrv.14
 for <qemu-riscv@nongnu.org>; Tue, 28 Dec 2021 02:35:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=plkme+8aCCTJ0si042HHRfHq8u78GI0L1XGN9yC+/6o=;
 b=rwh4jNgD+TSu89Alb+IxTNd2+w4pulas7nNYvspLOIxfE7MaDZHoL/py/92/aQIkM1
 EQWPC9e5oQvi9+nKBK+VZ5p2qMVFaIJdFSiZP/NwHJ/qc2HZtRnIW+5GiyMibnXbERTf
 pfFRc3n49QPFM4OcCdarewZVPiBPKo8/TbH3BGdm1lrGKRK5lC/k7AyL+IbRD4D6FwuH
 4d1E/8n/2+itAdkKijEwUBsXe5XB86MAs1E2ybr2I0OcaAF3nIorEbKmG7GUdLL6NbGY
 NbbqhRpZh8bpMoiYzrD8eqm6NR2p4stUGCVvFtfRW+doA0NXejt8aGV7eiKeqHqicVJj
 mb7Q==
X-Gm-Message-State: AOAM5315+Kh0bTB9hcEvlWQLFyLXby4Zsog4ulb193NaGJQlByokGe9F
 aP/+wKS8Fs0Br2lhBh9LtCVlfOswFWqwgbGnrfOj9sD0MUb6o4C014xnRzKd/SpYCS5/mP0X5V8
 cQlDNSQqwQoocBeE=
X-Received: by 2002:a05:6000:508:: with SMTP id
 a8mr7391134wrf.578.1640687733576; 
 Tue, 28 Dec 2021 02:35:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwzhuu1T/xXv/eLzkitd346DK+/44UfZ4LTnZ8krXnhqcG5nNsPleE+1N2zlUiLJppFsdOPGw==
X-Received: by 2002:a05:6000:508:: with SMTP id
 a8mr7391120wrf.578.1640687733376; 
 Tue, 28 Dec 2021 02:35:33 -0800 (PST)
Received: from [192.168.1.16] (adijon-655-1-69-27.w90-13.abo.wanadoo.fr.
 [90.13.240.27])
 by smtp.gmail.com with ESMTPSA id c7sm20748022wrq.81.2021.12.28.02.35.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 02:35:33 -0800 (PST)
Message-ID: <df3d3a3a-500b-8dd2-045c-7074682af27e@redhat.com>
Date: Tue, 28 Dec 2021 11:35:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/2] hw/dma: sifive_pdma: permit 4/8-byte access size of
 PDMA registers
To: Jim Shu <jim.shu@sifive.com>, Alistair.Francis@wdc.com,
 bin.meng@windriver.com, palmer@dabbelt.com, frank.chang@sifive.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20211228005236.415583-1-jim.shu@sifive.com>
 <20211228005236.415583-3-jim.shu@sifive.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211228005236.415583-3-jim.shu@sifive.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.573,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.024, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 28 Dec 2021 10:35:38 -0000

On 12/28/21 01:52, Jim Shu wrote:
> It's obvious that PDMA support 64-bit access of 64-bit registers, and
> in previous commit, we confirm that PDMA support 32-bit access of both
> 32/64-bit registers. Thus, we configure 32/64-bit memory access of
> PDMA registers as valid in general.
> 
> Signed-off-by: Jim Shu <jim.shu@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>  hw/dma/sifive_pdma.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
> index b8b198ab4e..731fcdcf89 100644
> --- a/hw/dma/sifive_pdma.c
> +++ b/hw/dma/sifive_pdma.c
> @@ -441,6 +441,10 @@ static const MemoryRegionOps sifive_pdma_ops = {
>      .impl = {
>          .min_access_size = 4,
>          .max_access_size = 8,
> +    },
> +    .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 8,
>      }
>  };
>  

Eh now I see this patch. It is correct, so:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

But I think the previous patch could be simpler.


