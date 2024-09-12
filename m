Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5286AEED617
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 16:14:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1somSi-0006NG-BA; Thu, 12 Sep 2024 12:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1somSf-00063v-JS
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2024 12:14:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1somSd-00081B-4u
 for qemu-riscv@nongnu.org; Thu, 12 Sep 2024 12:14:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726157661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=f0b6ry8Ezr/LJuQPzt/4qKls+i9F57WWKFMYh7hwV6o=;
 b=YpffFez5qnCvmKFZd4csrZhqzFAOfMqxsH59wqOT/efJ+7wF4mvmBPx2TMijhgpnuwHWc1
 v2dUpRr1K+p9jluOqd72tl3CQ+jZ17s0Q6NWFgR8XuwTih6NeKziCsPYndDedumC1SO+h9
 v7qpodJXYJe3rCVeFe9kzyXrt7d7PBQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-dCnvYcHFM5KEpCsPmqJonQ-1; Thu, 12 Sep 2024 12:14:19 -0400
X-MC-Unique: dCnvYcHFM5KEpCsPmqJonQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-5c384fc1c65so1462750a12.0
 for <qemu-riscv@nongnu.org>; Thu, 12 Sep 2024 09:14:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726157658; x=1726762458;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f0b6ry8Ezr/LJuQPzt/4qKls+i9F57WWKFMYh7hwV6o=;
 b=TrdUt4DlloipB6ntf35oLUs3sqE26HIRlgREL8lJyZFAcMVl3+iH4oD2gHikHFM1+y
 yjKHXR2moafPJL0TmzXRnl7D+MDxcTt7jwztaxhwikr7X0qsN0tHCnNJSqOd8vZIqUCV
 cAp1CFbB2iQ5Vh4ZYyN4KQTck4c7YfjL2qgHsO2DNy9Ug4TzBbqMKLYbNfOUhO7yu+b5
 emmqOh5XIGScE2NCJ2pue4oWn+px6H+LjHow277B6oN2KaWOMZs5snf+sxEpkcQXaTAH
 B3aLEQ9kkNFPt7mfboEFZ/dDlvmTEMBtwBqXdX1c1M1RFjaYtLG26RLtcVu55Ire6xMX
 3lhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXArJGYBprJ4ide0Z8ZUeUs4ApoAGKHHyrf9ii2T1KQuXcIPYE5bYdXHBTXsgk/WKH8hQ4QHSYnXu5z@nongnu.org
X-Gm-Message-State: AOJu0YwXtLuBpIP/GYLtQ/73JyvOCG5lGWOThXEzhAS1vsZ4qGEwdNQb
 NnqmTb64kalsJ4DyeoaDOVpEwTiK54ni7KojpLBNv0eI+HI8FFw/HE+sWIVpkCZeKvBld5IWngc
 FbtU1xmHUPUYS4DEdn4jXeGJQvOmGpWIX7nVhzVpe1X70PnoF5Jn3
X-Received: by 2002:a05:6402:2546:b0:5c2:7741:7d82 with SMTP id
 4fb4d7f45d1cf-5c4143626camr3319171a12.11.1726157657970; 
 Thu, 12 Sep 2024 09:14:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEW4s9xI2m+gPSP+KOKW2/eT/+C5yDBiqcOeWUmuDrQx9C2HWrZ1Da9f6NGDiY2kJx0xpd05g==
X-Received: by 2002:a05:6402:2546:b0:5c2:7741:7d82 with SMTP id
 4fb4d7f45d1cf-5c4143626camr3319143a12.11.1726157657432; 
 Thu, 12 Sep 2024 09:14:17 -0700 (PDT)
Received: from [192.168.55.123] (93-55-14-26.ip261.fastwebnet.it.
 [93.55.14.26]) by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd41c7dsm6671900a12.13.2024.09.12.09.14.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 09:14:16 -0700 (PDT)
Message-ID: <cf9642be-8169-496d-81ca-203ffa0f8edd@redhat.com>
Date: Thu, 12 Sep 2024 18:14:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/48] docs/spin: replace assert(0) with
 g_assert_not_reached()
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Laurent Vivier <lvivier@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Klaus Jensen <its@irrelevant.dk>, WANG Xuerui <git@xen0n.name>,
 Halil Pasic <pasic@linux.ibm.com>, Rob Herring <robh@kernel.org>,
 Michael Rolnik <mrolnik@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Corey Minyard <minyard@acm.org>,
 Keith Busch <kbusch@kernel.org>, Thomas Huth <thuth@redhat.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Kevin Wolf <kwolf@redhat.com>,
 Jesper Devantier <foss@defmacro.it>, Hyman Huang <yong.huang@smartx.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-s390x@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, qemu-riscv@nongnu.org,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, kvm@vger.kernel.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Hanna Reitz <hreitz@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Helge Deller <deller@gmx.de>, Peter Xu <peterx@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 Yanan Wang <wangyanan55@huawei.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Eric Farman <farman@linux.ibm.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>, qemu-block@nongnu.org,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 David Gibson <david@gibson.dropbear.id.au>, Fam Zheng <fam@euphon.net>,
 Weiwei Li <liwei1518@gmail.com>, Markus Armbruster <armbru@redhat.com>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
 <20240912073921.453203-2-pierrick.bouvier@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20240912073921.453203-2-pierrick.bouvier@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.143,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 9/12/24 09:38, Pierrick Bouvier wrote:
> This patch is part of a series that moves towards a consistent use of
> g_assert_not_reached() rather than an ad hoc mix of different
> assertion mechanisms.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

This is not C code, so please drop this patch.

Paolo

> ---
>   docs/spin/aio_notify_accept.promela | 6 +++---
>   docs/spin/aio_notify_bug.promela    | 6 +++---
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/docs/spin/aio_notify_accept.promela b/docs/spin/aio_notify_accept.promela
> index 9cef2c955dd..f929d303281 100644
> --- a/docs/spin/aio_notify_accept.promela
> +++ b/docs/spin/aio_notify_accept.promela
> @@ -118,7 +118,7 @@ accept_if_req_not_eventually_false:
>       if
>           :: req -> goto accept_if_req_not_eventually_false;
>       fi;
> -    assert(0);
> +    g_assert_not_reached();
>   }
>   
>   #else
> @@ -141,12 +141,12 @@ accept_if_event_not_eventually_true:
>           :: !event && notifier_done  -> do :: true -> skip; od;
>           :: !event && !notifier_done -> goto accept_if_event_not_eventually_true;
>       fi;
> -    assert(0);
> +    g_assert_not_reached();
>   
>   accept_if_event_not_eventually_false:
>       if
>           :: event     -> goto accept_if_event_not_eventually_false;
>       fi;
> -    assert(0);
> +    g_assert_not_reached();
>   }
>   #endif
> diff --git a/docs/spin/aio_notify_bug.promela b/docs/spin/aio_notify_bug.promela
> index b3bfca1ca4f..ce6f5177ed5 100644
> --- a/docs/spin/aio_notify_bug.promela
> +++ b/docs/spin/aio_notify_bug.promela
> @@ -106,7 +106,7 @@ accept_if_req_not_eventually_false:
>       if
>           :: req -> goto accept_if_req_not_eventually_false;
>       fi;
> -    assert(0);
> +    g_assert_not_reached();
>   }
>   
>   #else
> @@ -129,12 +129,12 @@ accept_if_event_not_eventually_true:
>           :: !event && notifier_done  -> do :: true -> skip; od;
>           :: !event && !notifier_done -> goto accept_if_event_not_eventually_true;
>       fi;
> -    assert(0);
> +    g_assert_not_reached();
>   
>   accept_if_event_not_eventually_false:
>       if
>           :: event     -> goto accept_if_event_not_eventually_false;
>       fi;
> -    assert(0);
> +    g_assert_not_reached();
>   }
>   #endif


