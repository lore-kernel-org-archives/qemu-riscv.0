Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pYy0b-00007v-EW
	for mharc-qemu-riscv@gnu.org; Sun, 05 Mar 2023 18:43:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pYy0Y-00007Q-U1
 for qemu-riscv@nongnu.org; Sun, 05 Mar 2023 18:43:14 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pYy0X-000733-6i
 for qemu-riscv@nongnu.org; Sun, 05 Mar 2023 18:43:14 -0500
Received: by mail-pl1-x631.google.com with SMTP id n6so8426364plf.5
 for <qemu-riscv@nongnu.org>; Sun, 05 Mar 2023 15:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678059791;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=yIh1lN+9dkH89Si6XgS1D9s5qWnDOWjVZhmy/Se/BVg=;
 b=CL1SrI+KTUaFE9ErX0FGLdJiQHw7Ytc+s0i18mpguULi+LwP3zU+tz+QMIoZYsVbtg
 GnflsIIob0GhvluDvGZ+Hnk6VXJNNDLYfKVtTxh90QCuzwrx6/izAC3kBy0StqnaD4H0
 DEvzR8ImTTfef3dH1A3qkoHlIbXNFgmcw0Egu8S+8x7CG0h70+Zc1eclbKyOJ7Y72yQ6
 VEMVDYaTAEfLXsGZmEKivJ6zmUrzPYOxfx4FPtnlUpJp5R1wy8e5mIUScpqL1njlqyyQ
 XRP45yzr/06IwqbkN60hW/+YeaiPV1oufejFM4kY+UYk+hZcg2u0/8TCdueleAt6wJ6F
 7HeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678059791;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yIh1lN+9dkH89Si6XgS1D9s5qWnDOWjVZhmy/Se/BVg=;
 b=nmo6luOTKH4RqMSclZ9wvjk1MeNsDvVUWpTgp7jiB167O452kJGGQyIeW7ap0fbAw6
 +Kq1SQUasRKziWHesdpsRH/XssDVc5fLVME2YvWqNYUjT2Yi+Bg4Hej+lb/MGOsXH+I5
 5DxY3oMuztk5Pw0l/d/S9DC1A+cVlhZtx5bCqykRkBENSV66UfMpx4tYxVn1YBj4A6fY
 o2spqD2tImDfA4LFtUm3RG+6CYtj8GjV1G0FaJxlFousHvPBhSFF+IfGChtO60w4Za4V
 sPRXQKH6AsPOBFsU+zClFP8oRyEBWqtbWl5oLianYYuBka5z7XcEPVcNkIRkGuwb0zzz
 nSiQ==
X-Gm-Message-State: AO0yUKVr/JKPdKaC5C9Q9Yq+G1EPq+YD9vJ/dYP3houhcw/Tp1PmI5wK
 vDmpx1uJWEi67SVlZjj70lQDbU9TDfvSrMG4Z9k=
X-Google-Smtp-Source: AK7set9avzaQ5XfCyzAUNbK9LDxodchHbhHbadhVIKQHslIiAb8J6no0UILnjxkTUDzwf+c/rteKag==
X-Received: by 2002:a17:902:c946:b0:19c:1433:5fba with SMTP id
 i6-20020a170902c94600b0019c14335fbamr11225704pla.0.1678059790718; 
 Sun, 05 Mar 2023 15:43:10 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 e4-20020a17090301c400b001898ee9f723sm5289843plh.2.2023.03.05.15.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 15:43:10 -0800 (PST)
Date: Sun, 05 Mar 2023 15:43:10 -0800 (PST)
X-Google-Original-Date: Sun, 05 Mar 2023 15:42:20 PST (-0800)
Subject: Re: [PATCH v2 1/2] gitlab/opensbi: Move to docker:stable
In-Reply-To: <CAEUhbmXVqJ3RnTk7OGquR-ChCSWJ8NmOGeo6kUmoFhipofm7tQ@mail.gmail.com>
CC: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Bin Meng <bmeng.cn@gmail.com>
Message-ID: <mhng-94876e10-142c-43de-bfa9-774e398cc502@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sun, 05 Mar 2023 23:43:15 -0000

On Fri, 03 Mar 2023 15:28:14 PST (-0800), Bin Meng wrote:
> On Sat, Mar 4, 2023 at 4:25 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>>
>> The OpenSBI build has been using docker:19.03.1, which appears to be old
>> enough that v2 of the manifest is no longer supported.  Something has
>> started serving us those manifests, resulting in errors along the lines
>> of
>>
>>     $ docker build --cache-from $IMAGE_TAG --tag $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA --tag $IMAGE_TAG .gitlab-ci.d/opensbi
>>     Step 1/7 : FROM ubuntu:18.04
>>     18.04: Pulling from library/ubuntu
>>     mediaType in manifest should be 'application/vnd.docker.distribution.manifest.v2+json' not 'application/vnd.oci.image.manifest.v1+json'
>>
>> This moves to docker:stable, as was suggested by the template.  It also
>> adds the python3 package via apt, as OpenSBI requires that to build.
>>
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>>  .gitlab-ci.d/opensbi.yml        | 4 ++--
>>  .gitlab-ci.d/opensbi/Dockerfile | 1 +
>>  2 files changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
>> index 04ed5a3ea1..9a651465d8 100644
>> --- a/.gitlab-ci.d/opensbi.yml
>> +++ b/.gitlab-ci.d/opensbi.yml
>> @@ -42,9 +42,9 @@
>>  docker-opensbi:
>>    extends: .opensbi_job_rules
>>    stage: containers
>> -  image: docker:19.03.1
>> +  image: docker:stable
>>    services:
>> -    - docker:19.03.1-dind
>> +    - docker:stable-dind
>>    variables:
>>      GIT_DEPTH: 3
>>      IMAGE_TAG: $CI_REGISTRY_IMAGE:opensbi-cross-build
>> diff --git a/.gitlab-ci.d/opensbi/Dockerfile b/.gitlab-ci.d/opensbi/Dockerfile
>> index 4ba8a4de86..2d151a6bc8 100644
>> --- a/.gitlab-ci.d/opensbi/Dockerfile
>> +++ b/.gitlab-ci.d/opensbi/Dockerfile
>> @@ -16,6 +16,7 @@ RUN apt update \
>>          git \
>>          make \
>>          wget \
>> +       python3 \
>
> nits: this should be inserted before wget to follow the alphabetical order

Thanks, I just squashed that in and stuck these on riscv-to-apply.next.  

>
>>      && \
>>      \
>>      rm -rf /var/lib/apt/lists/*
>> --
>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>

