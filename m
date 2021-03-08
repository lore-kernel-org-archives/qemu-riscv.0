Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lJG7e-0006cn-4I
	for mharc-qemu-riscv@gnu.org; Mon, 08 Mar 2021 08:40:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lJG7c-0006Yz-6t
 for qemu-riscv@nongnu.org; Mon, 08 Mar 2021 08:40:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lJG7W-0004Tr-Jh
 for qemu-riscv@nongnu.org; Mon, 08 Mar 2021 08:40:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615210823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P26XU5A2Ztslhnr/o+XDQv6sKntmkGm3RLFFw/EZ+a4=;
 b=gjIUhaYasU68ElPiQznJnCsHkHwDHlU0O76z7X4qbKRwk7hnyZEM5vN2FDOMaqEr9DA4lc
 YCi+WEu4+RRkDxbcJv+bdYf40FL+uAcWn6x/lqhEKu4YRpbU7hl6rZTfifXnP4PDJtM877
 +PUCH/9elWeRuL2dFRmFgBGPsH/5RWQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-OWt9f6tYPo-XBiaZoCdkyw-1; Mon, 08 Mar 2021 08:40:21 -0500
X-MC-Unique: OWt9f6tYPo-XBiaZoCdkyw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF3EF63ADA;
 Mon,  8 Mar 2021 13:40:19 +0000 (UTC)
Received: from [10.36.113.123] (ovpn-113-123.ams2.redhat.com [10.36.113.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 453FB60C43;
 Mon,  8 Mar 2021 13:40:07 +0000 (UTC)
Subject: Re: [RFC PATCH v2 1/8] sysemu/tcg: Restrict tcg_exec_init() to
 CONFIG_TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>,
 Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
References: <20210304222323.1954755-1-f4bug@amsat.org>
 <20210304222323.1954755-2-f4bug@amsat.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <e927dd5b-85c5-ddbf-aa16-2d1401a10bc3@redhat.com>
Date: Mon, 8 Mar 2021 14:40:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210304222323.1954755-2-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 08 Mar 2021 13:40:33 -0000

On 04.03.21 23:23, Philippe Mathieu-Daudé wrote:
> Invert the #ifdef'ry to easily restrict tcg_exec_init() declaration
> to CONFIG_TCG.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/sysemu/tcg.h | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
> index 00349fb18a7..fddde2b6b9a 100644
> --- a/include/sysemu/tcg.h
> +++ b/include/sysemu/tcg.h
> @@ -8,13 +8,15 @@
>   #ifndef SYSEMU_TCG_H
>   #define SYSEMU_TCG_H
>   
> +#ifndef CONFIG_TCG
> +#define tcg_enabled() 0
> +#else
> +
>   void tcg_exec_init(unsigned long tb_size, int splitwx);
>   
> -#ifdef CONFIG_TCG
>   extern bool tcg_allowed;
>   #define tcg_enabled() (tcg_allowed)
> -#else
> -#define tcg_enabled() 0
> -#endif
> +
> +#endif /* CONFIG_TCG */
>   
>   #endif
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


