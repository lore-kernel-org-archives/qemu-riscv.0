Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nUQu6-0006nC-5J
	for mharc-qemu-riscv@gnu.org; Wed, 16 Mar 2022 06:29:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nUQtx-0006ke-6r
 for qemu-riscv@nongnu.org; Wed, 16 Mar 2022 06:29:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nUQtu-0004nF-Cp
 for qemu-riscv@nongnu.org; Wed, 16 Mar 2022 06:29:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647426544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3ZG73wxzWLfcdWLW67pCExjrwvhATcoBiJyt8lfU9V8=;
 b=JS2b4U4zTceV6RnMiyacWTLjyd4lsEM3UOSWSzc7SyMzZ3BGJOHt6bq9Xh3rEHJ4ILBOyi
 gCBq730yelqQSnOFkQqhvpJGfGMA7fQnmHkcn7uoR/7fk6ZZNjpz2ONWZl8VhP0mPbDef0
 SstLDaN0ZYGDstwM6y3g/uVompRRJVk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-dldUh8j7MduQiJxjLYu9Yw-1; Wed, 16 Mar 2022 06:29:02 -0400
X-MC-Unique: dldUh8j7MduQiJxjLYu9Yw-1
Received: by mail-wr1-f72.google.com with SMTP id
 d17-20020adfc3d1000000b00203e2ff73a6so189170wrg.8
 for <qemu-riscv@nongnu.org>; Wed, 16 Mar 2022 03:29:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3ZG73wxzWLfcdWLW67pCExjrwvhATcoBiJyt8lfU9V8=;
 b=v12NiZO5S4mSoJn07uaqc4FnQWpDYxe8yvZADtscq4bZGA1lY9L/GcnVVxZYf9OOq2
 ykKE9Zywsl7XQ8m52+MU8Dmi+ZcHyeCNfpzoWPOwlEwRr4mTAYQUtmJ9uNSxHzJq0D/E
 cl4PP1qvKE71AlaK16RUZ1bIL7FivB2DQpMosqaaTB7G8QrYSSVIfEae/CZPFemMZun1
 99tI4Ahg0z7YwawhmkCmEb68gqTqLkvUaXRmi0gLjP3Yak3sOJZa5qW9Cmja49oxXLL5
 vB9xTj8zCuItOJF+s6Es3DMkMql3hVMY/QO784ZF6XugbLg7uzFwjFRlJ6QKxSDkdCIm
 dbDA==
X-Gm-Message-State: AOAM531XfzfzUGdQNSQf2l1OiZgPf1nQTD2KKOD1IHT4Tjz3L+BR2JRr
 4HN7qkP+tzPQlyMW4DdBuoLL+DsY/kQ1mmR8v9WVqjwo8DpcdFquk6oxMgy4lfshcvEkh3HD4cG
 eDo8lr5Vi6UK3qPk=
X-Received: by 2002:adf:efc6:0:b0:1f1:e397:44b with SMTP id
 i6-20020adfefc6000000b001f1e397044bmr23848650wrp.298.1647426541781; 
 Wed, 16 Mar 2022 03:29:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWc3yVEpZmzNiooTnfHTcTX/OjyOlZh11TgDwn9mo+DvgXsgZ+n28MBUHxJT6ufumaLGgdfA==
X-Received: by 2002:adf:efc6:0:b0:1f1:e397:44b with SMTP id
 i6-20020adfefc6000000b001f1e397044bmr23848591wrp.298.1647426541370; 
 Wed, 16 Mar 2022 03:29:01 -0700 (PDT)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a5d5988000000b00203d5f1f3e4sm1366873wri.105.2022.03.16.03.28.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 03:29:00 -0700 (PDT)
Message-ID: <9c101703-6aff-4188-a56a-8114281f75f4@redhat.com>
Date: Wed, 16 Mar 2022 11:28:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 10/27] Replace config-time define HOST_WORDS_BIGENDIAN
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Vikram Garhwal <fnu.vikram@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, Coiby Xu <Coiby.Xu@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>,
 "open list:ARM PrimeCell and..." <qemu-arm@nongnu.org>,
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:virtio-blk" <qemu-block@nongnu.org>
References: <20220316095308.2613651-1-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220316095308.2613651-1-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 16 Mar 2022 10:29:12 -0000

On 16/03/2022 10.53, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Replace a config-time define with a compile time condition
> define (compatible with clang and gcc) that must be declared prior to
> its usage. This avoids having a global configure time define, but also
> prevents from bad usage, if the config header wasn't included before.
> 
> This can help to make some code independent from qemu too.
> 
> gcc supports __BYTE_ORDER__ from about 4.6 and clang from 3.2.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
[...]
> @@ -188,7 +188,7 @@ CPU_CONVERT(le, 64, uint64_t)
>    * a compile-time constant if you pass in a constant.  So this can be
>    * used to initialize static variables.
>    */
> -#if defined(HOST_WORDS_BIGENDIAN)
> +#if HOST_BIG_ENDIAN
>   # define const_le32(_x)                          \
>       ((((_x) & 0x000000ffU) << 24) |              \
>        (((_x) & 0x0000ff00U) <<  8) |              \
> @@ -211,7 +211,7 @@ typedef union {
>   
>   typedef union {
>       float64 d;
> -#if defined(HOST_WORDS_BIGENDIAN)
> +#if HOST_BIG_ENDIAN
>       struct {
>           uint32_t upper;
>           uint32_t lower;
> @@ -235,7 +235,7 @@ typedef union {
>   
>   typedef union {
>       float128 q;
> -#if defined(HOST_WORDS_BIGENDIAN)
> +#if HOST_BIG_ENDIAN
>       struct {
>           uint32_t upmost;
>           uint32_t upper;
> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
> index 0a5e67fb970e..7fdd88adb368 100644
> --- a/include/qemu/compiler.h
> +++ b/include/qemu/compiler.h
> @@ -7,6 +7,8 @@
>   #ifndef COMPILER_H
>   #define COMPILER_H
>   
> +#define HOST_BIG_ENDIAN (__BYTE_ORDER__ == __ORDER_BIG_ENDIAN__)

Why don't you do it this way instead:

#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
#define HOST_WORDS_BIGENDIAN 1
#endif

... that way you could avoid the churn in all the other files?

  Thomas


