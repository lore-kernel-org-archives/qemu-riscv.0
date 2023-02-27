Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWZBw-0000fk-VA
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 03:49:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWZBv-0000fK-MN
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 03:49:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWZBt-0007fC-OU
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 03:49:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677487740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IZrUbL2/W00N28CAtosn7/KjD1UIRImQD+Z/FcTgo8c=;
 b=hMc3eZoyvggRq5ZgXdMGfOKb9KlGIokelZgckal51xKVOwAB8e66DgeCB/fOQ9CVKyUcnV
 LSRsqnZ3nnwRzub/NL4v54l0ZXz5JThg5txICeHrIBqfnCMhp/6JDzklI5gNVOR5HPm2w8
 0bavWHLCvtjPkeGGP0F5qS4uAevZpI0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-118-r4ACGfiwMs-UlxIVPn8ZtA-1; Mon, 27 Feb 2023 03:48:58 -0500
X-MC-Unique: r4ACGfiwMs-UlxIVPn8ZtA-1
Received: by mail-wm1-f71.google.com with SMTP id
 m31-20020a05600c3b1f00b003e9de8c95easo2140364wms.2
 for <qemu-riscv@nongnu.org>; Mon, 27 Feb 2023 00:48:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IZrUbL2/W00N28CAtosn7/KjD1UIRImQD+Z/FcTgo8c=;
 b=pB1OT+qFaToRyJ7ZWJFBl1Np/2zXVKSJcVn7p8VwleHiC/S9fMQckEwU0/IsYNUKoH
 Arav+4H69vkMrTSdw4R948yUNz4vzqFa+QMJHPmZc1coG5dkta/zJQNDc3LA1DYG4rpa
 LoGdJgSgPufuEFTy4ChF5XCmldedrz0oW4e97xNait8FyL4Xpgl/Eb9jzqQGriWuullV
 v+KmKssMJ8Kkzlv/GkQH7nVX+nb9zrCm5n62Ql4DSp3BJ7aaxfdpDLmK+FJ5UJ0rw5Z0
 aSpx4QrwfJI5qhmHM/OVP/VcTM/Vh58srENV1xdADqnCkI59ZM3Sy7qs01tvPvB4TJyo
 PXFw==
X-Gm-Message-State: AO0yUKUuQ5t3oBktEHndsj6c5rWSqawMnYDOV6tEAAwA72BFrY78l5+r
 Ky6Wq0wJK5WgwRpLikIgyke67TaCW+vBIZSGEKShw2Fr/tBg8dbdxtCgEPWxaZLu3jJVOOXD/u3
 cbgXTmb3UvtrBiPE=
X-Received: by 2002:adf:fb49:0:b0:2c6:6e35:4414 with SMTP id
 c9-20020adffb49000000b002c66e354414mr20931247wrs.6.1677487737671; 
 Mon, 27 Feb 2023 00:48:57 -0800 (PST)
X-Google-Smtp-Source: AK7set+GOuc6XqfMA7bmS+WrJRKq8cCQ86YqwPA/d6ckKhN1Q2ppUWL1lppu/wcX3J1f3KELZUq77g==
X-Received: by 2002:adf:fb49:0:b0:2c6:6e35:4414 with SMTP id
 c9-20020adffb49000000b002c66e354414mr20931235wrs.6.1677487737437; 
 Mon, 27 Feb 2023 00:48:57 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-150.web.vodafone.de.
 [109.43.176.150]) by smtp.gmail.com with ESMTPSA id
 l16-20020adfe590000000b002c70e60eb40sm6466669wrm.11.2023.02.27.00.48.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 00:48:56 -0800 (PST)
Message-ID: <69d38817-8363-58eb-83dc-a1c7db5d4f8a@redhat.com>
Date: Mon, 27 Feb 2023 09:48:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] gitlab/opensbi: Move to docker:stable
To: Palmer Dabbelt <palmer@rivosinc.com>, Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20230224212543.20462-1-palmer@rivosinc.com>
 <20230224212543.20462-2-palmer@rivosinc.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230224212543.20462-2-palmer@rivosinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 27 Feb 2023 08:49:03 -0000

On 24/02/2023 22.25, Palmer Dabbelt wrote:
> The OpenSBI build has been using docker:19.03.1, which appears to be old
> enough that v2 of the manifest is no longer supported.  Something has
> started serving us those manifests, resulting in errors along the lines
> of
> 
>      $ docker build --cache-from $IMAGE_TAG --tag $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA --tag $IMAGE_TAG .gitlab-ci.d/opensbi
>      Step 1/7 : FROM ubuntu:18.04
>      18.04: Pulling from library/ubuntu
>      mediaType in manifest should be 'application/vnd.docker.distribution.manifest.v2+json' not 'application/vnd.oci.image.manifest.v1+json'
> 
> This just moves to docker:stable, as was suggested by the template.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>   .gitlab-ci.d/opensbi.yml | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
> index 04ed5a3ea1..9a651465d8 100644
> --- a/.gitlab-ci.d/opensbi.yml
> +++ b/.gitlab-ci.d/opensbi.yml
> @@ -42,9 +42,9 @@
>   docker-opensbi:
>     extends: .opensbi_job_rules
>     stage: containers
> -  image: docker:19.03.1
> +  image: docker:stable
>     services:
> -    - docker:19.03.1-dind
> +    - docker:stable-dind
>     variables:
>       GIT_DEPTH: 3
>       IMAGE_TAG: $CI_REGISTRY_IMAGE:opensbi-cross-build

Reviewed-by: Thomas Huth <thuth@redhat.com>


