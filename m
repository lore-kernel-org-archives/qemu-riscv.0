Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lYPbx-0007PS-3r
	for mharc-qemu-riscv@gnu.org; Mon, 19 Apr 2021 04:50:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lYPbv-0007Oe-3I; Mon, 19 Apr 2021 04:50:27 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:47080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lYPbt-0005rD-BX; Mon, 19 Apr 2021 04:50:26 -0400
Received: by mail-il1-x129.google.com with SMTP id l19so24576219ilk.13;
 Mon, 19 Apr 2021 01:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qjDKK2b8zaIKdFcqtXLEaJRSFx178MBsvfzE51n7Ngs=;
 b=cZJqo1VbyF4h9snRdW0KT51qN+uMBBxkyw4Q3fOnkvqs1NDAFlmxG1uHszY/TzsxYx
 obxjVF4Y/HhsREoTH5rojTmxnYCClL6RU2fk33NUxcdj1JmDq2y11n0s4kr3c2ilvBf7
 HfBYzKsjzeGeiHLEfjg0AnXNLijXG19mZnvn9LTqH0s4iIAxzn0Z8VRSjHcsz4AAgVjP
 ybxRghKT7Lw6umcq/25lbpfL1yE/Utxt3FXnRxk6SGdniN8fC+ZMRD08isngtrDwJ2a8
 KElkCg4jT1ddBGfbkNui3X/kCr0zzHLEXcPku9nS0FiUu1XavjTet4lN+F3IFrR5r5TQ
 keWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qjDKK2b8zaIKdFcqtXLEaJRSFx178MBsvfzE51n7Ngs=;
 b=fCpxvvNudEBKe4Kw+ZszvChjT9gvM+fAKJgEZoFK3jiqnPk2XvfZw9zL8uhnDVq04P
 6FC+MKZzdO2vKkk68MQ5T9eQvM4IZ3Wf476C4s7INKnGzvVodWgPN/yxp4og4ov6jY9K
 2R1hMU2ngpstgOhDm15d2DSfH5bgvFk0Hacp9Pm/qd8CQmI19LudHPMX+mXE0jDZqenS
 9p04FICLkENmJYCesQqAcrR+/xnwD3bZO8AjMOQS3ZebejVHGDBAyW4svyiVIX42hciL
 rszTEfPV8WkjpJWD7ndGdnaHP8chWwGHP0NePL4mRy9aBjXyOAAVZezA9q6QauG5g7Ng
 OOXQ==
X-Gm-Message-State: AOAM531Li9NQeBBpICj3dXUaX3rIwOoYpAhLo6/gCKhWV7hIzrj4HVx2
 Rv90VHNQk8q5OuEb+Afb9XbFvVa5HBmtSXSPZo4=
X-Google-Smtp-Source: ABdhPJzINQ1Y4Chln6quK8e8cl0uiKfKTedF7Xw0xcTNOhtZvBjGxE4jNdpN7cAbmEh4SJQiGMEocEWMWBj7O2zeU0E=
X-Received: by 2002:a92:d383:: with SMTP id o3mr16497126ilo.131.1618822223905; 
 Mon, 19 Apr 2021 01:50:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210419060145.11152-1-frank.chang@sifive.com>
 <CAKmqyKOwZeqbbeZxQ2uGiKxGWZrBUk5Xq93kAeQecrFy9p718g@mail.gmail.com>
 <CANzO1D2sRnzezeae89J4P+dBw_h0NSTX2SQUEStNo1K8dyquTQ@mail.gmail.com>
In-Reply-To: <CANzO1D2sRnzezeae89J4P+dBw_h0NSTX2SQUEStNo1K8dyquTQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 19 Apr 2021 18:49:56 +1000
Message-ID: <CAKmqyKMJW63O1P0wwKpWXM5QWgy8NCrrMiZzBXw37-JC7Ft_QQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: fix vssub.vv saturation bug
To: Frank Chang <0xc0de0125@gmail.com>
Cc: Frank Chang <frank.chang@sifive.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x129.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 19 Apr 2021 08:50:27 -0000

On Mon, Apr 19, 2021 at 4:31 PM Frank Chang <0xc0de0125@gmail.com> wrote:
>
> Alistair Francis <alistair23@gmail.com> =E6=96=BC 2021=E5=B9=B44=E6=9C=88=
19=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=882:28=E5=AF=AB=E9=81=93=EF=
=BC=9A
>>
>> On Mon, Apr 19, 2021 at 4:02 PM <frank.chang@sifive.com> wrote:
>> >
>> > From: Frank Chang <frank.chang@sifive.com>
>> >
>> > Doing a negate (0x0 =E2=80=93 0x80000000) using vssub.vv produces
>> > an incorrect result of 0x80000000 (should saturate to 0x7fffffff)
>> >
>> > Fix this bug by treating zero as a positive number.
>> >
>> > Signed-off-by: Frank Chang <frank.chang@sifive.com>
>>
>> Thanks for the patch!
>>
>> A similar fix is already in the riscv-to-apply.next queue
>>
>>    target/riscv: Fixup saturate subtract function
>>
>>    The overflow predication ((a - b) ^ a) & (a ^ b) & INT64_MIN is right=
.
>>    However, when the predication is ture and a is 0, it should return ma=
ximum.
>>
>>    Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>>    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>    Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>    Message-id: 20210212150256.885-4-zhiwei_liu@c-sky.com
>>    Message-Id: <20210212150256.885-4-zhiwei_liu@c-sky.com>
>>
>>
>> Alistair
>
>
> Thanks, I might missed that patch.

No worries. Thanks anyway for the fix.

Alistair

> Frank Chang
>
>>
>>
>> > ---
>> >  target/riscv/vector_helper.c | 8 ++++----
>> >  1 file changed, 4 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper=
.c
>> > index a156573d281..356cef8a090 100644
>> > --- a/target/riscv/vector_helper.c
>> > +++ b/target/riscv/vector_helper.c
>> > @@ -2451,7 +2451,7 @@ static inline int8_t ssub8(CPURISCVState *env, i=
nt vxrm, int8_t a, int8_t b)
>> >  {
>> >      int8_t res =3D a - b;
>> >      if ((res ^ a) & (a ^ b) & INT8_MIN) {
>> > -        res =3D a > 0 ? INT8_MAX : INT8_MIN;
>> > +        res =3D a >=3D 0 ? INT8_MAX : INT8_MIN;
>> >          env->vxsat =3D 0x1;
>> >      }
>> >      return res;
>> > @@ -2461,7 +2461,7 @@ static inline int16_t ssub16(CPURISCVState *env,=
 int vxrm, int16_t a, int16_t b)
>> >  {
>> >      int16_t res =3D a - b;
>> >      if ((res ^ a) & (a ^ b) & INT16_MIN) {
>> > -        res =3D a > 0 ? INT16_MAX : INT16_MIN;
>> > +        res =3D a >=3D 0 ? INT16_MAX : INT16_MIN;
>> >          env->vxsat =3D 0x1;
>> >      }
>> >      return res;
>> > @@ -2471,7 +2471,7 @@ static inline int32_t ssub32(CPURISCVState *env,=
 int vxrm, int32_t a, int32_t b)
>> >  {
>> >      int32_t res =3D a - b;
>> >      if ((res ^ a) & (a ^ b) & INT32_MIN) {
>> > -        res =3D a > 0 ? INT32_MAX : INT32_MIN;
>> > +        res =3D a >=3D 0 ? INT32_MAX : INT32_MIN;
>> >          env->vxsat =3D 0x1;
>> >      }
>> >      return res;
>> > @@ -2481,7 +2481,7 @@ static inline int64_t ssub64(CPURISCVState *env,=
 int vxrm, int64_t a, int64_t b)
>> >  {
>> >      int64_t res =3D a - b;
>> >      if ((res ^ a) & (a ^ b) & INT64_MIN) {
>> > -        res =3D a > 0 ? INT64_MAX : INT64_MIN;
>> > +        res =3D a >=3D 0 ? INT64_MAX : INT64_MIN;
>> >          env->vxsat =3D 0x1;
>> >      }
>> >      return res;
>> > --
>> > 2.17.1
>> >
>> >

